provider "aws" {
  region = var.env_region[var.env]
  version = "~> 2.7"
}

module "capacity" {
  source = "./capacity"
}

module "earth" {
  source = "./earth"
}

module "element" {
  source = "./element"
}

module "water" {
  source = "./water"
}

module "wind" {
  source = "./wind"
}

output "cert_arn" {
  value = module.acm.cert_arn
}
