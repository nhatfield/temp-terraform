variable "env" {
  description = "Environment"
  type        = string
  default     = "dev"
}

variable "env_lb_prv_subnets" {
  description = "VPC subnets"
}

variable "env_security_groups" {
  description = "Security groups"
}

variable "env_vpcid" {
  description = "vpc id"
}

variable "env_port" {
  description = "Default application port"
}

variable "env_deploy" {
  description = "Deployment Name"
}

