terraform {
  backend "azurerm" {
    resource_group_name  = "rg-terra"
    storage_account_name = "louis1storage"
    container_name       = "louis-container"
    key                  = "dev.terraform.tfstate"
  }
}
