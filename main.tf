provider "azurerm" {
  features {}
  version = "2.90.0"
}

module "ResourceGroup" {
  source = "./ResourceGroup"
  base_name = "vm-module-test"
  location = "West Europe"
}

module "VM" {
  source = "./VMs"
  rg_name = module.ResourceGroup.rg_name_out
}