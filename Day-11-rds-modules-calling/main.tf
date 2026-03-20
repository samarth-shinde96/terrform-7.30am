module "rds" {
  source = "github.com/samarth-shinde96/terrform-7.30am.git/Day-11-rds-module"

  environment = var.environment
  vpc_cidr    = var.vpc_cidr

  subnet_cidr_1 = var.subnet_cidr_1
  subnet_cidr_2 = var.subnet_cidr_2

  subnet_az_1   = var.subnet_az_1
  subnet_az_2   = var.subnet_az_2

  db_subnet_group_name = var.db_subnet_group_name

  db_instance_class = var.db_instance_class
  db_username       = var.db_username
}