locals {
  common_tags = {
    environment = var.env_name
    application = var.resource_name
  }
}

module "network" {
  source = "../../modules//network"

  env_name      = var.env_name
  resource_name = var.resource_name
  common_tags   = local.common_tags
}