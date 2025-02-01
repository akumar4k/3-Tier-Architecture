module "frontend" {
  source              = "./modules/app_service"
  location           = var.location
  resource_group_name = var.resource_group_name
  frontend_name       = var.frontend_name
}

module "aks" {
  source              = "./modules/aks"
  location           = var.location
  resource_group_name = var.resource_group_name
  aks_dev_name        = var.aks_dev_name
  aks_prod_name       = var.aks_prod_name
}

module "mongodb" {
  source              = "./modules/mongodb"
  location           = var.location
  resource_group_name = var.resource_group_name
  mongodb_name        = var.mongodb_name
}
