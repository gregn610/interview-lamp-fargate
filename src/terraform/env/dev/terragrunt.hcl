# Check locals carefully, rest is mostly boilerplate

terraform {
  source = "../..//stacks/full"
}

locals {
  env_name      = "dev"
  resource_name = "demoapp"
}

inputs = {
  env_name      = local.env_name
  resource_name = local.resource_name
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

include {
  path = find_in_parent_folders()
}
