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
