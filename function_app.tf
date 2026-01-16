resource "azurerm_resource_group" "fapp_resource_group" {
    name     = "fapp_resource_group"
    location = "East US"
  
}

resource "azurerm_storage_account" "fapp_storage_account" {
  name                     = "itcfunctionsappsa"
  resource_group_name      = azurerm_resource_group.fapp_resource_group.name
  location                 = azurerm_resource_group.fapp_resource_group.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_app_service_plan" "app_service_plan" {
  name                = "itc-azure-functions-service-plan"
  location            = azurerm_resource_group.fapp_resource_group.location
  resource_group_name = azurerm_resource_group.fapp_resource_group.name

  sku {
    tier = "Standard"
    size = "S1"
  }
}

resource "azurerm_function_app" "function_app" {
  name                       = "itc-azure-functions"
  location                   = azurerm_resource_group.fapp_resource_group.location
  resource_group_name        = azurerm_resource_group.fapp_resource_group.name
  app_service_plan_id        = azurerm_app_service_plan.app_service_plan.id
  storage_account_name       = azurerm_storage_account.fapp_storage_account.name
  storage_account_access_key = azurerm_storage_account.fapp_storage_account.primary_access_key
}