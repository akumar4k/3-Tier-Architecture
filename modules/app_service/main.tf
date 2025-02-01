resource "azurerm_service_plan" "app_service_plan" {
  name                = "app-service-plan"
  location            = var.location
  resource_group_name = var.resource_group_name
  os_type             = "Linux"
  sku_name            = "B1"
}

resource "azurerm_app_service" "frontend" {
  name                = var.frontend_name
  location            = var.location
  resource_group_name = var.resource_group_name
  app_service_plan_id = azurerm_service_plan.app_service_plan.id

  site_config {
    linux_fx_version = "NODE|18-lts"
  }

  app_settings = {
    "REACT_APP_API_URL" = "https://api.${var.aks_dev_name}.azure.com"
  }
}
