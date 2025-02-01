resource "azurerm_kubernetes_cluster" "aks_dev" {
  name                = "dev-aks-cluster"
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = "dev-aks"

  default_node_pool {
    name       = "default"
    node_count = 2
    vm_size    = "Standard_D2_v2"
  }

  identity {
    type = "SystemAssigned"
  }
}

resource "azurerm_kubernetes_cluster" "aks_prod" {
  name                = "prod-aks-cluster"
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = "prod-aks"

  default_node_pool {
    name       = "default"
    node_count = 3
    vm_size    = "Standard_D2_v2"
    auto_scaling_enabled = true
    min_count = 2
    max_count = 5
    }

  identity {
    type = "SystemAssigned"
  }

  private_cluster_enabled = true
}
