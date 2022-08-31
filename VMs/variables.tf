variable "vnet_name" {
  type    = string
  default = "defaultvnet"
}

variable "address_space" {
  type    = any
  default = ["10.0.0.0/16"]
}

variable "address_prefixes" {
  type    = any
  default = ["10.0.0.0/24"]
}

variable "ip_name" {
  type    = string
  default = "internal"
}

variable "private_ip_address_allocation" {
  type    = string
  default = "Dynamic"
}

variable "defaultPublicIP_name" {
  type    = string
  default = "publicIP"
}

variable "nic_name" {
  type    = string
  default = "nic1"
}

variable "defaultPublicIP_allocation_method" {
  type    = string
  default = "Dynamic"
}

variable "subnet_name" {
  type    = string
  default = "defaultsubnet"
}

variable "azurerm_network_security_group-name" {
  type    = string
  default = "nsg1"
}
variable "countVM" {
  type    = number
  default = 1
}

variable "base_name" {
  type    = string
  default = "vm"
}

variable "rg_name" {
  type    = string
  default = "vm-module-test"
}
variable "location" {
  type    = string
  default = "westeurope"
}

variable "size" {
  type    = string
  default = "Standard_D2s_v3"
}

variable "admin_username" {
  type    = string
  default = "adminuser"
}

variable "admin_password" {
  type    = string
  default = "Pa$$word123!@1"
}

variable "caching" {
  type    = string
  default = "ReadWrite"
}

variable "storage_account_type" {
  type    = string
  default = "Standard_LRS"
}

variable "publisher" {
  type    = string
  default = "MicrosoftWindowsDesktop"
}

variable "offer" {
  type    = string
  default = "office-365"
}

variable "sku" {
  type    = string
  default = "win10-21h2-avd-m365"
}

variable "version_OS" {
  type    = string
  default = "latest"
}

variable "managed_disk_name" {
  type    = string
  default = "vm-disk1"
}

variable "storage_account_type_md" {
  type    = string
  default = "Standard_LRS"
}

variable "create_option_md" {
  type    = string
  default = "Empty"
}

variable "disk_size_md" {
  type    = number
  default = 10
}

variable "lun_md" {
  type    = string
  default = "10"
}

variable "caching_md" {
  type    = string
  default = "ReadWrite"
}
