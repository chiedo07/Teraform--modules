resource "azurerm_resource_group" "existing" {
  name     = "rg-terra"
  location = var.location
}

resource "azurerm_virtual_network" "vnet" {
  name                = "LC-vnet-${terraform.workspace}"
  location            = var.location
  resource_group_name = azurerm_resource_group.main.name
  address_space       = ["10.0.0.0/16"]
}
