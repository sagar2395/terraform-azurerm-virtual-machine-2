locals {
  resource_group_name  = element(coalescelist(data.azurerm_resource_group.rg.*.name, azurerm_resource_group.rg.*.name, [""]), 0)
  virtual_network_name = element(coalescelist(data.azurerm_virtual_network.vnet.*.name, azurerm_virtual_network.vnet.*.name, [""]), 0)
  subnet_name          = element(coalescelist(data.azurerm_subnet.subnet.*.name, azurerm_subnet.subnet.*.name, [""]), 0)
  subnet_id            = element(coalescelist(data.azurerm_subnet.subnet.*.id, azurerm_subnet.subnet.*.id, [""]), 0)
}