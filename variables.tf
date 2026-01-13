# Root-level variables

variable "location" {
  description = "Azure region to deploy resources"
  default     = "eastus"
}

variable "storage_names" {
  description = "List of storage accounts to create"
  default     = ["one", "two"]
}

variable "resource_group_name" {
  description = "Existing Resource Group name to deploy resources into"
  default     = "rg-terra"
}
