// Resource Group variables

variable "existing_resource_group" {
  default = true
}

variable "resource_group_name" {
  default = "vm-rg"
}

variable "location" {
  default = "eastus"
}

// Virtual Machine variables

variable "virtual_machine_name" {
  default = "example-vm"
}

variable "admin_username" {
  default = "admin"
}