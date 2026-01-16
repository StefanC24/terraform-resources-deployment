resource "azurerm_resource_group" "eventgrid_resource_group" {
    name     = "eventgrid_resource_group"
    location = "East US"
  
}

resource "azurerm_eventgrid_domain" "example" {
    name                = "my-eventgrid-domain"
    location            = azurerm_resource_group.eventgrid_resource_group.location    
    resource_group_name = azurerm_resource_group.eventgrid_resource_group.name

    tags = {
        environment = "Development"
    }
}