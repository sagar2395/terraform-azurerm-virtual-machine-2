resource "azurerm_linux_virtual_machine" "vm" {

  name                = var.virtual_machine_name
  resource_group_name = local.resource_group_name
  location            = var.location
  admin_username      = var.admin_username
  #   license_type = 
  #   networ_interface_ids = 
  #   os_disk =
  #   size = 
  #   admin_password = 
  #   admin_ssh_key = 

}