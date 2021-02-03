

# Just wrap turnerlabs as a sub module for now. Consider refactoring later.
module "fargate" {
  source = "./turnerlabs/tf"

  env_name      = var.env_name
  resource_name = var.resource_name
  common_tags   = var.common_tags

  aws_region      = var.aws_region
  vpc             = var.vpc
  private_subnets = var.private_subnets
  public_subnets  = var.public_subnets

  container_port  = var.container_port
  health_check    = var.health_check
  certificate_arn = var.certificate_arn


}
