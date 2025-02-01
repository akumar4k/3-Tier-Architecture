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

variable "frontend_name" {
  description = "Frontend App Service Name"
  type        = string
  default     = "reactjs-app"
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

variable "mongodb_name" {
  description = "MongoDB Instance Name"
  type        = string
  default     = "mongodb-cluster"
}
