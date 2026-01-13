module "vnet" {
  source   = "./modules/vnet"
  location = "eastus"
}

# 1️⃣ Reference the existing Resource Group
data "azurerm_resource_group" "existing" {
  name = var.resource_group_name
}

# 2️⃣ Call the core module
module "core" {
  source   = "./modules/vnet"
  location = var.location
  # No need to create a new RG inside the module
}

# 3️⃣ Loop: create multiple Storage Accounts in the existing RG
resource "azurerm_storage_account" "loop" {
  for_each                 = toset(var.storage_names)
  name                     = "lc${each.key}${terraform.workspace}"  # unique per workspace
  resource_group_name      = data.azurerm_resource_group.existing.name
  location                 = data.azurerm_resource_group.existing.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

# 4️⃣ Output the existing RG location
output "rg_location" {
  value = data.azurerm_resource_group.existing.location
}
