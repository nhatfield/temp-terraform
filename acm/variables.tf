variable "env" {
  description = "Environment"
  type        = string
  default     = "dev"
}

variable "env_fqdn" {
  description = "Domain name"
}

variable "env_san" {
  description = "Subject Alternative Names"
}
