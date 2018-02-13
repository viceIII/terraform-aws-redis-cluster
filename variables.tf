variable "environment" {
  default = "Unknown"
}

variable "vpc_id" {}

variable "subnet_ids" {
  type = "list"
}

variable "security_group_ids" {
  type = "list"
}

variable "redis_identifier" {}

variable "parameter_group" {
  default = "redis3.2"
}

variable "maintenance_window" {}

variable "desired_clusters" {
  default = "1"
}

variable "instance_type" {
  default = "cache.m4.large"
}

variable "engine_version" {
  default = "3.2.4"
}

variable "automatic_failover_enabled" {
  default = false
}
