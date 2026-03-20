variable "environment" {}
variable "vpc_cidr" {}

# ✅ multi AZ variables
variable "subnet_cidr_1" {}
variable "subnet_cidr_2" {}

variable "subnet_az_1" {}
variable "subnet_az_2" {}

variable "allowed_cidr_blocks" {
  type = list(string)
}

variable "db_subnet_group_name" {}

variable "db_identifier" {}
variable "db_name" {}
variable "db_engine" {}
variable "db_engine_version" {}

variable "db_instance_class" {}
variable "db_allocated_storage" {}
variable "db_username" {}

variable "db_backup_retention_period" {}
variable "backup_window" {}
variable "maintenance_window" {}

variable "db_deletion_protection" {}
variable "db_skip_final_snapshot" {}