resource "azurerm_linux_virtual_machine" "vm" {
  count = var.number_of_vms
  name                            = var.virtual_machine_name
  resource_group_name             = local.resource_group_name
  location                        = var.location
  admin_username                  = var.admin_username
  admin_password                  = var.disable_password_authentication == false && var.admin_password == null ? element(concat(random_password.admin_password.*.result, [""]), 0) : var.admin_password
  disable_password_authentication = var.disable_password_authentication
  size = var.vm_size

  network_interface_ids = [element(concat(azurerm_network_interface.nic.*.id, [""]), count.index)]

  os_disk {
    caching              = var.caching
    storage_account_type = var.storage_account_type
  }
  #   license_type = 
  #   networ_interface_ids = 
  #   os_disk =
  #   size = 
  #   admin_password = 
  #   admin_ssh_key = 

}