variable "env_name" {
  type        = string
  description = "The environment name to use when prefixing and tagging resources. eg. (dev|staging|prod)"
}

variable "resource_name" {
  type        = string
  description = "Used in resource names and tags. eg. demoapp"
}

variable "common_tags" {
  type        = map(any)
  description = "Common AWS resource tags"
  default     = {}
}
# TurnerLabs

variable "aws_region" {
  description = "AWS region the resources are deployed to"
}

# The port the container will listen on, used for load balancer health check
# Best practice is that this value is higher than 1024 so the container processes
# isn't running at root.
variable "container_port" {
}

# The port the load balancer will listen on
variable "lb_port" {
  default = "80"
}

# The load balancer protocol
variable "lb_protocol" {
  default = "HTTP"
}

# Network configuration
#
variable "vpc" {
  description = "The VPC to use for the Fargate cluster"
}

#
variable "private_subnets" {
  description = "The private subnets, minimum of 2, that are a part of the VPC(s)"
}

#
variable "public_subnets" {
  description = "The public subnets, minimum of 2, that are a part of the VPC(s)"
}

variable "health_check" {
  description = "The path to the health check for the load balancer to know if the container(s) are ready"
}

variable "certificate_arn" {
  description = "The ARN for the SSL certificate"
}

variable "https_port" {
  description = "The port to listen on for HTTPS, always use 443"
  default     = "443"
}
