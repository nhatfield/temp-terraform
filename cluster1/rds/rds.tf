resource "aws_db_instance" "capacity" {
  multi_az                  = "true"
  name                      = var.env_db_name
  db_subnet_group_name      = aws_db_subnet_group.subnet_group_capacity.name
  vpc_security_group_ids    = var.env_security_groups[var.env]
  allocated_storage         = var.env_db_storage_size[var.env]
  storage_type              = var.env_db_storage_type[var.env]
  engine                    = var.env_db_engine[var.env]
  engine_version            = var.env_db_version[var.env]
  instance_class            = var.env_db_instance_type[var.env]
  identifier                = var.env_db_identifier[var.env]
  username                  = var.env_db_username[var.env]
  password                  = var.env_db_password[var.env]
  final_snapshot_identifier = var.env_db_identifier[var.env]

  tags = {
    Name      = var.env_db_identifier[var.env],
    Netuitive = "True",
    Tenant    = var.env
  }
}

resource "aws_db_subnet_group" "subnet_group_capacity" {
  name        = "tf-${var.env}"
  description = "Private subnets for RDS instance"
  subnet_ids  = var.env_subnets[var.env]
}
