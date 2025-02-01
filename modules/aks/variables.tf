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
