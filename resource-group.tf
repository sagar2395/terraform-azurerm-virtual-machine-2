data "azurerm_resource_group" "rg" {
  count = var.existing_resource_group == true ? 1 : 0
  name  = var.resource_group_name
}

resource "azurerm_resource_group" "rg" {
  count    = var.existing_resource_group == false ? 1 : 0
  name     = var.resource_group_name
  location = var.location
}