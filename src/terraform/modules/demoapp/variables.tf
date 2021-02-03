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
