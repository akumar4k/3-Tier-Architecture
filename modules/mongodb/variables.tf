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



variable "mongodb_name" {
description = "MongoDB Instance Name"
type        = string
default     = "mongodb-cluster"
}
variable "mongodb_admin_user" {
  description = "Admin MongoDB user"
  type        = string
  sensitive   = true
}

variable "mongodb_admin_password" {
  description = "Admin MongoDB password"
  type        = string
  sensitive   = true
}

variable "mongodb_app_user" {
  description = "Application MongoDB user"
  type        = string
}

variable "mongodb_password" {
  description = "Application MongoDB user password"
  type        = string
  sensitive   = true
}

