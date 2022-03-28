// Virtual Network

resource "azurerm_virtual_network" "vnet" {
  count               = var.existing_virtual_network == false ? 1 : 0
  name                = var.virtual_network_name
  location            = var.location
  resource_group_name = local.resource_group_name
  address_space       = var.address_space
  dns_servers         = var.dns_servers
}

data "azurerm_virtual_network" "vnet" {
  count               = var.existing_virtual_network == true ? 1 : 0
  name                = var.virtual_network_name
  resource_group_name = local.resource_group_name
}

// Subnet

resource "azurerm_subnet" "subnet" {
  count                = var.existing_subnet == false ? 1 : 0
  name                 = var.subnet_name
  resource_group_name  = local.resource_group_name
  virtual_network_name = local.virtual_network_name
}

data "azurerm_subnet" "subnet" {
  count                = var.existing_subnet == true ? 1 : 0
  name                 = var.subnet_name
  resource_group_name  = local.resource_group_name
  virtual_network_name = local.virtual_network_name
}

// Public Ip

resource "azurerm_public_ip" "public_ip" {
  count               = var.enable_public_ip_address == true ? var.number_of_vms : 0
  name                = lower("public-ip-${count.index + 1}")
  resource_group_name = local.resource_group_name
  location            = var.location
  allocation_method   = "Static"
}

// Network Interface 

resource "azurerm_network_interface" "nic" {
  count                         = var.number_of_vms
  name                          = lower("nic-${count.index + 1}")
  resource_group_name           = local.resource_group_name
  location                      = var.location
  dns_servers                   = var.dns_servers
  enable_ip_forwarding          = var.enable_ip_forwarding
  enable_accelerated_networking = var.enable_accelerated_networking
  #   internal_dns_name_label       = var.internal_dns_name_label

  ip_configuration {
    name                          = lower("ipconfig-${count.index + 1}")
    primary                       = true
    subnet_id                     = local.subnet_id
    private_ip_address_allocation = var.private_ip_address_allocation
    private_ip_address            = var.private_ip_address_allocation_type == "Static" ? element(concat(var.private_ip_address, [""]), count.index) : null
    public_ip_address_id          = var.enable_public_ip_address == true ? element(concat(azurerm_public_ip.public_ip.*.id, [""]), count.index) : null
  }
}