resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  location            = var.location
  resource_group_name = var.rg_name
  address_space       = var.address_space
}

resource "azurerm_subnet" "defaultSubnet" {
  name                 = var.subnet_name
  resource_group_name  = var.rg_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = var.address_prefixes
}

resource "azurerm_public_ip" "defaultPublicIP" {
  name                = var.defaultPublicIP_name
  location            = var.location
  resource_group_name = var.rg_name
  allocation_method   = var.defaultPublicIP_allocation_method
}

resource "azurerm_network_interface" "nic" {
  name                = var.nic_name
  location            = var.location
  resource_group_name = var.rg_name

  ip_configuration {
    name                          = var.ip_name
    subnet_id                     = azurerm_subnet.defaultSubnet.id
    private_ip_address_allocation = var.private_ip_address_allocation
    public_ip_address_id          = azurerm_public_ip.defaultPublicIP.id
  }
}

resource "azurerm_network_security_group" "nsg" {
  name                = var.azurerm_network_security_group-name
  location            = var.location
  resource_group_name = var.rg_name
  security_rule {
    name                       = "allow-rdp"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = 3389
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

resource "azurerm_subnet_network_security_group_association" "nsg_association" {
  subnet_id                 = azurerm_subnet.defaultSubnet.id
  network_security_group_id = azurerm_network_security_group.nsg.id
}

resource "azurerm_windows_virtual_machine" "example" {
  #count = var.countVM
  name                = var.base_name
  resource_group_name = var.rg_name
  location            = var.location
  size                = var.size
  admin_username      = var.admin_username
  admin_password      = var.admin_password

  network_interface_ids = [azurerm_network_interface.nic.id]
  os_disk {
    caching              = var.caching
    storage_account_type = var.storage_account_type
  }

  source_image_reference {
    publisher = var.publisher
    offer     = var.offer
    sku       = var.sku
    version   = var.version_OS
  }

}

resource "azurerm_managed_disk" "example" {
  name                 = var.managed_disk_name
  location             = var.location
  resource_group_name  = var.rg_name
  storage_account_type = var.storage_account_type_md
  create_option        = var.create_option_md
  disk_size_gb         = var.disk_size_md
}

resource "azurerm_virtual_machine_data_disk_attachment" "example" {
  managed_disk_id    = azurerm_managed_disk.example.id
  virtual_machine_id = azurerm_windows_virtual_machine.example.id
  lun                = var.lun_md
  caching            = var.caching_md
}
