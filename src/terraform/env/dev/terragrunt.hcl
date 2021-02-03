# Check locals carefully, rest is mostly boilerplate

terraform {
  source = "../..//stacks/full"
}

locals {
  env_name      = "dev"
  resource_name = "demoapp"
  aws_region    = "eu-west-2"
}

inputs = {
  env_name      = local.env_name
  resource_name = local.resource_name
  aws_region    = local.aws_region
}

remote_state {
  backend = "s3"
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
  config = {
    bucket         = format("terraform-remote-state-%s", get_aws_account_id())
    dynamodb_table = format("terraform-remote-state-%s", get_aws_account_id())
    key            = format("%s/%s/terraform.tfstate", local.env_name, local.resource_name)
    encrypt        = true
    region         = "eu-west-2" # All TF remote state for account in same region
  }
}

generate "provider" {
  path      = "providers.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
provider "aws" {
  region = var.aws_region
}
EOF

}

include {
  path = find_in_parent_folders()
}
