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


