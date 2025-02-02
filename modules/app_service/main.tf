# Azure App Service Plan (Linux for React)
resource "azurerm_service_plan" "app_service_plan" {
  name                = "frontend-plan"
  location            = var.location
  resource_group_name = var.resource_group_name
  os_type             = "Linux"
  sku_name            = "P1v2"  # Change SKU if needed
}

# Azure App Service for Frontend (Production Slot)
resource "azurerm_app_service" "frontend" {
  name                = "frontend-app"
  location            = var.location
  resource_group_name = var.resource_group_name
  app_service_plan_id = azurerm_service_plan.app_service_plan.id

  site_config {
    linux_fx_version = "DOCKER|myacr.azurecr.io/frontend:latest"
  }

  app_settings = {
    "DOCKER_REGISTRY_SERVER_URL"      = "https://${azurerm_container_registry.acr.login_server}"
    "DOCKER_REGISTRY_SERVER_USERNAME" = azurerm_container_registry.acr.admin_username
    "DOCKER_REGISTRY_SERVER_PASSWORD" = azurerm_container_registry.acr.admin_password
  }
}

# # Staging Deployment Slot
resource "azurerm_app_service_slot" "staging" {
  name                = "staging"
  app_service_name    = azurerm_app_service.frontend.name
  resource_group_name = var.resource_group_name
  location            = var.location # Required for consistency
  app_service_plan_id = azurerm_service_plan.app_service_plan.id # Ensure plan association

  site_config {
    linux_fx_version = "DOCKER|${azurerm_container_registry.acr.login_server}/frontend:staging"
  }

  app_settings = {
    "DOCKER_REGISTRY_SERVER_URL"      = "https://${azurerm_container_registry.acr.login_server}"
    "DOCKER_REGISTRY_SERVER_USERNAME" = azurerm_container_registry.acr.admin_username
    "DOCKER_REGISTRY_SERVER_PASSWORD" = azurerm_container_registry.acr.admin_password
  }
}

# Dev Deployment Slot
resource "azurerm_app_service_slot" "dev" {
  name                = "dev"
  app_service_name    = azurerm_app_service.frontend.name
  resource_group_name = var.resource_group_name
  location            = var.location # Required for consistency
  app_service_plan_id = azurerm_service_plan.app_service_plan.id # Ensure plan association

  site_config {
    linux_fx_version = "DOCKER|${azurerm_container_registry.acr.login_server}/frontend:dev"
  }

  app_settings = {
    "DOCKER_REGISTRY_SERVER_URL"      = "https://${azurerm_container_registry.acr.login_server}"
    "DOCKER_REGISTRY_SERVER_USERNAME" = azurerm_container_registry.acr.admin_username
    "DOCKER_REGISTRY_SERVER_PASSWORD" = azurerm_container_registry.acr.admin_password
  }
}

# Azure Container Registry (For storing React app images)
resource "azurerm_container_registry" "acr" {
  name                = "myacr"
  resource_group_name = var.resource_group_name
  location            = var.location
  sku                 = "Basic"
  admin_enabled       = true
}
