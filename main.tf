terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "5.10.0"
    }
    archive = {
      source  = "hashicorp/archive"
      version = "2.8.1"
    }
  }
}

provider "azurerm" {
  features {}
}

provider "archive" {
}

resource "azurerm_resource_group" "example" {
  name     = var.resource_group_name
  location = var.location
}


module "network" {
  source = "./modules/network"

  location                    = var.location
  resource_group_name         = azurerm_resource_group.example.name
  virtual_network_name        = var.virtual_network_name
  vnet_address_prefix         = var.vnet_address_prefix
  subnet_name                 = var.subnet_name
  subnet_address_prefix       = var.subnet_address_prefix
  network_security_group_name = var.network_security_group_name
  public_ip_address_name      = var.public_ip_address_name
  dns_label                   = var.dns_label
}

module "compute" {
  source = "./modules/compute"

  depends_on = [azurerm_storage_blob.archive]

  location                  = var.location
  resource_group_name       = azurerm_resource_group.example.name
  subnet_name               = var.subnet_name
  subnet_id                 = module.network.subnet_id
  public_ip_id              = module.network.public_ip_id
  network_security_group_id = module.network.network_security_group_id
  public_ip_address_name    = var.public_ip_address_name
  vm_name                   = var.vm_name
  vm_size                   = var.vm_size
  ssh_key_public            = var.ssh_key_public
  app_archive_url           = "https://${module.storage.storage_account_name}.blob.core.windows.net/task-artifacts/storageblob"
  storage_account_name      = module.storage.storage_account_name
  storage_account_key       = module.storage.storage_account_primary_access_key
}

module "storage" {
  source = "./modules/storage"

  location            = var.location
  resource_group_name = azurerm_resource_group.example.name
}
