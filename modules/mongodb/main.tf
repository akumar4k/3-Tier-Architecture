resource "azurerm_cosmosdb_account" "mongodb" {
  name                = "mongodb-cluster"
  location            = var.location
  resource_group_name = var.resource_group_name
  offer_type          = "Standard"
  kind                = "MongoDB"

  consistency_policy {
    consistency_level = "Session"
  }

  geo_location {
    location          = var.location
    failover_priority = 0
  }

  mongo_server_version = "4.0"
}


resource "null_resource" "create_mongo_user" {
  provisioner "local-exec" {
    command = <<EOT
      mongo "mongodb+srv://${azurerm_cosmosdb_account.mongodb.connection_strings[0]}" \
      --username ${var.mongodb_admin_user} --password ${var.mongodb_admin_password} \
      --eval "db.createUser({ user: '${var.mongodb_app_user}', pwd: '${data.azurerm_key_vault_secret.mongodb_password.value}', roles: [{ role: 'readWrite', db: 'app-db' }] })"
    EOT
  }
}

output "mongodb_password" {
  value     = data.azurerm_key_vault_secret.mongodb_password.value
  sensitive = true
}


