resource "azurerm_databricks_workspace" "databricks" {
    name                = "databricks${random_string.databricks_name.result}"
    resource_group_name = azurerm_resource_group.resource_group.name
    location            = azurerm_resource_group.resource_group.location
    sku                 = "standard"

    tags = {
        environment = "production"
    }
}

resource "random_string" "databricks_name" {
    length  = 8
    special = false
    upper   = false
}
