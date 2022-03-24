locals {
  resource_group_name = element(coalescelis(data.azurerm_resource_group.rg.*.name, azurerm_resource_group.rg.*.name, [""]), 0)
}