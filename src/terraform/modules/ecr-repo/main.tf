resource "aws_iam_role" "ecr_principle" {
  name = "${var.env_name}-${var.resource_name}-ecr-principle"
  path = "/${var.env_name}/${var.resource_name}/"

  assume_role_policy = file("${path.module}/files/ecr-principle-assume-role.json")
  tags               = var.common_tags
}

# Using registry module
module "ecr_repo" {
  source  = "cloudposse/ecr/aws"
  version = "0.31.1"

  namespace              = var.resource_name
  stage                  = var.env_name
  name                   = "${var.env_name}-${var.resource_name}"
  principals_full_access = [aws_iam_role.ecr_principle.arn]
  tags                   = var.common_tags
}