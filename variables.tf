variable "env" {
  description = "Environment"
  type        = string
  default     = "dev"
}

variable "env_region" {
  description = "AWS Region"
  type        = map

  default     = {
      "dev" = "us-west-2"
      "uat" = "us-east-1"
      "app" = "us-west-2"
      "eu"  = "eu-west-1"
  }
}
