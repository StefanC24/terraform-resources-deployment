resource "azurerm_resource_group" "df_resource_group" {
    name     = "df_resource_group"
    location = "East US"
  
}

resource "azurerm_data_factory" "data_factory" {
  name                = "itcdatafactory"
  location            = azurerm_resource_group.df_resource_group.location
  resource_group_name = azurerm_resource_group.df_resource_group.name
}