resource "azurerm_kubernetes_cluster" "dev_aks" {
  name                = var.aks_dev_name
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = "devaks"

  default_node_pool {
    name       = "agentpool"
    node_count = 2
    vm_size    = "Standard_DS2_v2"
  }

  identity {
    type = "SystemAssigned"
  }
}

resource "azurerm_kubernetes_cluster" "prod_aks" {
  name                = var.aks_prod_name
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = "prodaks"

  default_node_pool {
    name       = "agentpool"
    node_count = 3
    vm_size    = "Standard_DS3_v2"
  }

  #api_server_authorized_ip_ranges = []  # Private AKS (No Public Access)

  identity {
    type = "SystemAssigned"
  }
}
