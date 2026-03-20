resource "aws_vpc" "name" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = var.environment
  }
}

resource "aws_subnet" "name" {
  vpc_id            = aws_vpc.name.id
  cidr_block        = var.subnet_cidr
  availability_zone = var.subnet_az
}

resource "aws_db_subnet_group" "name" {
  name       = var.db_subnet_group_name
  subnet_ids = [aws_subnet.name.id]

  tags = {
    Name = var.db_subnet_group_name
  }
}

resource "aws_db_instance" "name" {
  allocated_storage           = var.db_allocated_storage
  db_name                     = var.db_name
  identifier                  = var.db_identifier
  engine                      = var.db_engine
  engine_version              = var.db_engine_version
  instance_class              = var.db_instance_class
  username                    = var.db_username
  manage_master_user_password = true

  db_subnet_group_name        = aws_db_subnet_group.name.name

  backup_retention_period     = var.db_backup_retention_period
  backup_window               = var.backup_window
  maintenance_window          = var.maintenance_window
  deletion_protection         = var.db_deletion_protection
  skip_final_snapshot         = var.db_skip_final_snapshot
}