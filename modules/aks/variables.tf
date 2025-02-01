variable "location" {
  description = "Azure Region"
  type        = string
  default     = "East US"
}

variable "resource_group_name" {
  description = "Resource Group Name"
  type        = string
  default     = "3tier-architecture"
}

variable "aks_dev_name" {
  description = "Public AKS Cluster for Dev and UAT"
  type        = string
  default     = "aks-dev-uat"
}

variable "aks_prod_name" {
  description = "Private AKS Cluster for Production"
  type        = string
  default     = "aks-prod"
}

variable "vnet_name" {
  description = "The name of the virtual network"
  default     = "aks-vnet"
}

variable "aks_cluster_name" {
  description = "The name of the AKS cluster"
  default     = "aks-private-cluster"
}

variable "aks_subnet_name" {
  description = "The name of the subnet for the AKS nodes"
  default     = "aks-subnet"
}

variable "private_dns_zone_name" {
  description = "The DNS zone for the private AKS cluster"
  default     = "privatelink.eastus.azmk8s.io"
}