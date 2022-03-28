// Resource Group variables

variable "existing_resource_group" {
  default = false
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

variable "admin_password" {
}

variable "random_password_length" {
  default = 12
}

variable "disable_password_authentication" {
  default = false
}

variable "os" {
  default = "linux"
}

variable "number_of_vms" {
  default = 1
}

variable "vm_size" {
  default = "Standard_F2"
}

variable "caching" {
  default = "None"
}

variable "storage_account_type" {
  default = "Standard_LRS"
}


// Network Variables

variable "dns_servers" {
  default = []
}

variable "enable_ip_forwarding" {
  default = false
}

variable "enable_accelerated_networking" {
  default = false
}

variable "internal_dns_name_label" {
  default = ""
}

variable "address_space" {
  default = ["10.0.0.0/16"]
}

variable "existing_virtual_network" {
  default = false
}

variable "virtual_network_name" {
  default = "example-vnet"
}

variable "existing_subnet" {
  default = false
}

variable "subnet_name" {
  default = "example-subnet"
}

variable "private_ip_address_allocation" {
  default = false
}

variable "private_ip_address_allocation_type" {
  default = "Dyanmic"
}

variable "private_ip_address" {

}

variable "enable_public_ip_address" {
  default = false
}