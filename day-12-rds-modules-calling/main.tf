module "rds" {
  source = "../day-12-rds-modules"

  environment = var.environment
  vpc_cidr    = var.vpc_cidr

  subnet_cidr_1 = var.subnet_cidr_1
  subnet_cidr_2 = var.subnet_cidr_2

  subnet_az_1 = var.subnet_az_1
  subnet_az_2 = var.subnet_az_2

  allowed_cidr_blocks  = var.allowed_cidr_blocks
  db_subnet_group_name = var.db_subnet_group_name

  db_identifier     = var.db_identifier
  db_name           = var.db_name
  db_engine         = var.db_engine
  db_engine_version = var.db_engine_version

  db_instance_class    = var.db_instance_class
  db_allocated_storage = var.db_allocated_storage
  db_username          = var.db_username

  db_backup_retention_period = var.db_backup_retention_period
  backup_window              = var.backup_window
  maintenance_window         = var.maintenance_window

  db_deletion_protection = var.db_deletion_protection
  db_skip_final_snapshot = var.db_skip_final_snapshot
}