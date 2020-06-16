# Load shared service modules
module "rds" {
  source = "./rds"
}


# Load service modules
module "service1" {
  source = "./service1"
}
