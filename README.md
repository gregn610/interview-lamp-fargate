
# Whiteboard Session
 - Draw a 3-tier web architecture diagram, for a LAMP(Linux Apache Mysql and PHP) application in AWS (very high level)

- Then, they’ll ask questions related to your diagram: What resources are required to implement this architecture in Terraform: VPC, Subnets, Routing tables, ALBs, Targetgroups, Security Groups

# Architecture
![architecture](./docs/images/architecture.png "Architecture diagram")

# Code layout
```console

```

# AWS Resources
## Network Module
 - module.network.module.vpc.aws_cloudwatch_log_group.flow_log[0]
 - module.network.module.vpc.aws_eip.nat[0]
 - module.network.module.vpc.aws_flow_log.this[0]
 - module.network.module.vpc.aws_iam_policy.vpc_flow_log_cloudwatch[0]
 - module.network.module.vpc.aws_iam_role.vpc_flow_log_cloudwatch[0]
 - module.network.module.vpc.aws_iam_role_policy_attachment.vpc_flow_log_cloudwatch[0]
 - module.network.module.vpc.aws_internet_gateway.this[0]
 - module.network.module.vpc.aws_nat_gateway.this[0]
 - module.network.module.vpc.aws_route.private_nat_gateway[0]
 - module.network.module.vpc.aws_route.public_internet_gateway[0]
 - module.network.module.vpc.aws_route_table.private[0]
 - module.network.module.vpc.aws_route_table.public[0]
 - module.network.module.vpc.aws_route_table_association.private[0]
 - module.network.module.vpc.aws_route_table_association.private[1]
 - module.network.module.vpc.aws_route_table_association.private[2]
 - module.network.module.vpc.aws_route_table_association.public[0]
 - module.network.module.vpc.aws_route_table_association.public[1]
 - module.network.module.vpc.aws_route_table_association.public[2]
 - module.network.module.vpc.aws_subnet.private[0]
 - module.network.module.vpc.aws_subnet.private[1]
 - module.network.module.vpc.aws_subnet.private[2]
 - module.network.module.vpc.aws_subnet.public[0]
 - module.network.module.vpc.aws_subnet.public[1]
 - module.network.module.vpc.aws_subnet.public[2]
 - module.network.module.vpc.aws_vpc.this[0]
 - module.network.module.vpc.aws_vpc_endpoint.s3[0]
 - module.network.module.vpc.aws_vpc_endpoint_route_table_association.private_s3[0]
 - module.network.module.vpc.aws_vpc_endpoint_route_table_association.public_s3[0]
 - module.network.module.vpc.data.aws_iam_policy_document.flow_log_cloudwatch_assume_role[0]
 - module.network.module.vpc.data.aws_iam_policy_document.vpc_flow_log_cloudwatch[0]
 - module.network.module.vpc.data.aws_vpc_endpoint_service.s3[0]
 
## ECR Repo Module
 - module.ecr_repo.aws_iam_role.ecr_principle
 - module.ecr_repo.module.ecr_repo.aws_ecr_lifecycle_policy.name["demoapp-dev-dev-demoapp"]
 - module.ecr_repo.module.ecr_repo.aws_ecr_repository.name["demoapp-dev-dev-demoapp"]
 - module.ecr_repo.module.ecr_repo.aws_ecr_repository_policy.name["demoapp-dev-dev-demoapp"]
 - module.ecr_repo.module.ecr_repo.data.aws_iam_policy_document.empty[0]
 - module.ecr_repo.module.ecr_repo.data.aws_iam_policy_document.resource[0]
 - module.ecr_repo.module.ecr_repo.data.aws_iam_policy_document.resource_full_access[0]
 - module.ecr_repo.module.ecr_repo.data.aws_iam_policy_document.resource_readonly_access[0]



# Deploy

## Prerequisites
 - Terragrunt
 - Terraform
 
## Deploy Steps
Check AWS credentials
```shell script
aws sts get-caller-identity

```
 
```shell script
pushd src/terraform/env/dev
terragrunt init
teragrunt plan
terragrunt apply

```
