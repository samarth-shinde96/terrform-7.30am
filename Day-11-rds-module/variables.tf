variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "dev"
}

variable "vpc_cidr" {
  description = "VPC CIDR block"
  type        = string
}

variable "subnet_cidr" {
  description = "Subnet CIDR block"
  type        = string
}

variable "subnet_az" {
  description = "Availability zone"
  type        = string
}

variable "db_subnet_group_name" {
  description = "DB subnet group name"
  type        = string
}

variable "db_identifier" {
  description = "RDS identifier"
  type        = string
  default     = "devtest"
}

variable "db_name" {
  description = "Database name"
  type        = string
  default     = "mydb"
}

variable "db_engine" {
  description = "DB engine"
  type        = string
  default     = "mysql"
}

variable "db_engine_version" {
  description = "DB engine version"
  type        = string
  default     = "8.0"
}

variable "db_instance_class" {
  description = "Instance class"
  type        = string
}

variable "db_allocated_storage" {
  description = "Storage in GB"
  type        = number
  default     = 20
}

variable "db_username" {
  description = "DB username"
  type        = string
}

variable "db_backup_retention_period" {
  description = "Backup retention days"
  type        = number
  default     = 7
}

variable "backup_window" {
  description = "Backup window"
  type        = string
  default     = "03:00-04:00"
}

variable "maintenance_window" {
  description = "Maintenance window"
  type        = string
  default     = "Sun:05:00-Sun:06:00"
}

variable "db_deletion_protection" {
  description = "Deletion protection"
  type        = bool
  default     = false
}

variable "db_skip_final_snapshot" {
  description = "Skip final snapshot"
  type        = bool
  default     = true
}