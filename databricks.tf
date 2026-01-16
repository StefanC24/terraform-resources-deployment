resource "azurerm_resource_group" "dbricks_resource_group" {
    name     = "dbricks_resource_group"
    location = "East US"
  
}

resource "azurerm_databricks_workspace" "databricks" {
    name                = "itcdatabricks"
    resource_group_name = azurerm_resource_group.dbricks_resource_group.name
    location            = azurerm_resource_group.resource_group.location
    sku                 = "standard"

    tags = {
        environment = "Development"
    }
}