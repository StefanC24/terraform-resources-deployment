resource "azurerm_resource_group" "resource_group" {
    name     = "rg-storage-account"
    location = "East US"
  
}

resource "azurerm_storage_account" "storage" {
    name                     = "storageaccount${random_string.storage_name.result}"
    resource_group_name      = azurerm_resource_group.resource_group.name
    location                 = azurerm_resource_group.resource_group.location
    account_tier             = "Standard"
    account_replication_type = "LRS"

    tags = {
        environment = "production"
    }
}

resource "random_string" "storage_name" {
    length  = 8
    special = false
    upper   = false
}