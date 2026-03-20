variable "environment" {}
variable "vpc_cidr" {}

variable "subnet_cidr_1" {}
variable "subnet_cidr_2" {}

variable "subnet_az_1" {}
variable "subnet_az_2" {}

variable "allowed_cidr_blocks" {
  type = list(string)
}

variable "db_subnet_group_name" {}

variable "db_identifier" { default = "devtest" }
variable "db_name" { default = "mydb" }
variable "db_engine" { default = "mysql" }
variable "db_engine_version" { default = "8.0" }

variable "db_instance_class" {}
variable "db_allocated_storage" { default = 20 }
variable "db_username" {}

variable "db_backup_retention_period" { default = 7 }
variable "backup_window" { default = "03:00-04:00" }
variable "maintenance_window" { default = "Sun:05:00-Sun:06:00" }

variable "db_deletion_protection" { default = false }
variable "db_skip_final_snapshot" { default = true }