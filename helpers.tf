resource "random_password" "admin_password" {
  count       = (var.os == "linux" && var.disable_password_authentication == false && var.admin_password == null ? 1 : (var.os == "windows" && var.admin_password == null ? 1 : 0))
  length      = var.random_password_length
  min_upper   = 4
  min_lower   = 2
  min_numeric = 4

  keepers = {
    admin_password = var.virtual_machine_name
  }
}