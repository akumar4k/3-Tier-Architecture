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
  network_profile {
    network_plugin = "azure"
    network_policy = "calico"
    load_balancer_sku = "standard"
    
    }
    private_cluster_public_fqdn_enabled = true # public access able 
}

# Create Virtual Network
resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = ["10.0.0.0/16"]
}

# Create Subnet for AKS Cluster
resource "azurerm_subnet" "aks_subnet" {
  name                 = var.aks_subnet_name
  resource_group_name  =  var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}

# Create Subnet for AKS Control Plane
resource "azurerm_subnet" "aks_control_plane_subnet" {
  name                      = "aks-control-plane-subnet"
  resource_group_name       =  var.resource_group_name
  virtual_network_name      = azurerm_virtual_network.vnet.name
  address_prefixes          = ["10.0.2.0/24"]
  service_endpoints         = ["Microsoft.ContainerService"]
}

# Create Private DNS Zone
resource "azurerm_private_dns_zone" "private_dns" {
  name                = var.private_dns_zone_name
  resource_group_name = var.resource_group_name
}

# Link Private DNS Zone with Virtual Network
resource "azurerm_private_dns_zone_virtual_network_link" "vnet_link" {
  name                  = "aks-vnet-link"
  private_dns_zone_name = azurerm_private_dns_zone.private_dns.name
  resource_group_name   = var.resource_group_name
  virtual_network_id    = azurerm_virtual_network.vnet.id
}

# Create ProdAKS Cluster
resource "azurerm_kubernetes_cluster" "aks_prod" {
  name                = var.aks_cluster_name
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = "aks_prod"
  private_cluster_enabled = true

  default_node_pool {
    name       = "default"
    node_count = 3
    vm_size    = "Standard_DS2_v2"
    auto_scaling_enabled = true
    min_count = 2
    max_count = 5
    vnet_subnet_id = azurerm_subnet.aks_subnet.id
  }

  identity {
    type = "SystemAssigned"
  }
     
  network_profile {
    network_plugin = "azure"
    network_policy = "calico"
    load_balancer_sku = "standard"
    
    }
      
    private_cluster_public_fqdn_enabled = false # No public access, only private access
      
    # Enable Private DNS for AKS
  private_dns_zone_id = azurerm_private_dns_zone.private_dns.id
}
