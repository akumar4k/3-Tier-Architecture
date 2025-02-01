resource "azurerm_key_vault" "kv" {
  name                = "app-keyvault"
  location            = var.location
  resource_group_name = var.resource_group_name
  sku_name            = "standard"
  tenant_id           = "YOUR_TENANT_ID"
}

resource "azurerm_key_vault_secret" "acr_password" {
  name         = "acr-password"
  value        = azurerm_container_registry.acr.admin_password
  key_vault_id = azurerm_key_vault.kv.id
}

data "azurerm_key_vault_secret" "mongodb_password" {
  name         = "mongodb-password"
  key_vault_id = azurerm_key_vault.kv.id
}
