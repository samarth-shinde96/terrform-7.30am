variable "environment" {
  description = "Environment name"
  type        = string
}

variable "vpc_cidr" {
  description = "VPC CIDR"
  type        = string
}

variable "subnet_cidr" {
  description = "Subnet CIDR"
  type        = string
}

variable "subnet_az" {
  description = "Availability Zone"
  type        = string
}

variable "allowed_cidr_blocks" {
  description = "Allowed CIDR blocks"
  type        = list(string)
}

variable "db_subnet_group_name" {
  description = "DB subnet group name"
  type        = string
}

variable "db_identifier" {
  type    = string
  default = "devtest"
}

variable "db_name" {
  type    = string
  default = "mydb"
}

variable "db_engine" {
  type    = string
  default = "mysql"
}

variable "db_engine_version" {
  type    = string
  default = "8.0"
}

variable "db_instance_class" {
  type = string
}

variable "db_allocated_storage" {
  type    = number
  default = 20
}

variable "db_username" {
  type = string
}

variable "db_backup_retention_period" {
  type    = number
  default = 7
}

variable "backup_window" {
  type    = string
  default = "03:00-04:00"
}

variable "maintenance_window" {
  type    = string
  default = "Sun:05:00-Sun:06:00"
}

variable "db_deletion_protection" {
  type    = bool
  default = false
}

variable "db_skip_final_snapshot" {
  type    = bool
  default = true
}