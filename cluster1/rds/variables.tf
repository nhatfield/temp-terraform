variable "env" {
  description = "Environment"
  type        = string
  default     = "dev"
}

variable "env_availability_zone" {
  description = "Availability zone"
}

variable "env_subnets" {
  description = "VPC subnets"
}

variable "env_security_groups" {
  description = "Security groups"
}

variable "env_zookeeper" {
  description = "Instance types"
}

variable "env_db_engine" {
  description = "DB Engine Type"
}

variable "env_db_version" {
  description = "DB Version"
}

variable "env_db_instance_type" {
  description = "DB Instance Type"
}

variable "env_db_name" {
  description = "DB Name"
}

variable "env_db_identifier" {
  description = "DB Identifier"
}

variable "env_db_storage_size" {
  description = "DB Storage Size"
}

variable "env_db_storage_type" {
  description = "DB Storage Type"
}

variable "env_db_username" {
  description = "DB Username"
}

variable "env_db_password" {
  description = "DB Password"
}
