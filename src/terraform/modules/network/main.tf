# Using registry module
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "2.70.0"

  name = "${var.env_name}-${var.resource_name}"
  cidr = "10.10.0.0/16" # 10.0.0.0/8 is reserved for EC2-Classic

  # Basic public private setup across AZs for DR/HA
  azs = [
    data.aws_availability_zones.available.names[0],
    data.aws_availability_zones.available.names[1],
    data.aws_availability_zones.available.names[2],
  ]
  private_subnets = ["10.10.11.0/24", "10.10.12.0/24", "10.10.13.0/24"]
  public_subnets  = ["10.10.21.0/24", "10.10.22.0/24", "10.10.23.0/24"]

  create_database_subnet_group = false

  enable_nat_gateway = true
  single_nat_gateway = true

  # VPC endpoint for S3
  enable_s3_endpoint = true

  # VPC Flow Logs (Cloudwatch log group and IAM role will be created)
  enable_flow_log                      = true
  create_flow_log_cloudwatch_log_group = true
  create_flow_log_cloudwatch_iam_role  = true
  flow_log_max_aggregation_interval    = 60

  tags = var.common_tags

  vpc_endpoint_tags = var.common_tags
}
