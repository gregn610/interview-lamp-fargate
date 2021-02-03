
# Whiteboard Session
 - Draw a 3-tier web architecture diagram, for a LAMP(Linux Apache Mysql and PHP) application in AWS (very high level)

- Then, they’ll ask questions related to your diagram: What resources are required to implement this architecture in Terraform: VPC, Subnets, Routing tables, ALBs, Targetgroups, Security Groups

# Architecture
![architecture](./docs/images/architecture.png "Architecture diagram")

# Code layout
```console

```

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
