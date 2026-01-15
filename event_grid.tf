    resource "azurerm_eventgrid_domain" "example" {
  name                = "my-eventgrid-domain"
  location            = azurerm_resource_group.resource_group.location
  resource_group_name = azurerm_resource_group.resource_group.name

  tags = {
    environment = "Development"
  }
}