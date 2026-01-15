resource "azurerm_resource_group" "resource_group" {
    name     = "rg-storage-account"
    location = "East US"
  
}

resource "azurerm_storage_account" "storage" {
    name                     = "itcstorageaccountsa"
    resource_group_name      = azurerm_resource_group.resource_group.name
    location                 = azurerm_resource_group.resource_group.location
    account_tier             = "Standard"
    account_replication_type = "LRS"

    tags = {
        environment = "development"
    }
}