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

module "ecr_repo" {
  source = "../../modules//ecr-repo"

  env_name      = var.env_name
  resource_name = var.resource_name
  common_tags   = local.common_tags
}

module "demo_app" {
  source = "../../modules//demo-app"

  env_name      = var.env_name
  resource_name = var.resource_name
  common_tags   = local.common_tags

  aws_region      = var.aws_region
  vpc             = module.network.vpc_id
  private_subnets = join(",", module.network.private_subnets)
  public_subnets  = join(",", module.network.public_subnets)

  health_check = "/healthz"
  certificate_arn = "arn:aws:acm:eu-west-2:074234086608:certificate/0431c855-16d4-4543-b6f6-a46bfb396115" # ToDo: hosted zone & certificate
}
