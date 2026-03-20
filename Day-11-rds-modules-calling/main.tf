module "rds" {
    source = "github.com/samarth-shinde96/terrform-7.30am./Day-11-rds-module"
}

resource "aws_vpc" "this" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = var.environment
  }
}

resource "aws_subnet" "this" {
  vpc_id            = aws_vpc.this.id
  cidr_block        = var.subnet_cidr
  availability_zone = var.subnet_az

  tags = {
    Name = "${var.environment}-subnet"
  }
}

resource "aws_security_group" "db_sg" {
  name   = "${var.environment}-db-sg"
  vpc_id = aws_vpc.this.id

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = var.allowed_cidr_blocks
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_db_subnet_group" "this" {
  name       = var.db_subnet_group_name
  subnet_ids = [aws_subnet.this.id]

  tags = {
    Name = var.db_subnet_group_name
  }
}

resource "aws_db_instance" "this" {
  allocated_storage           = var.db_allocated_storage
  db_name                     = var.db_name
  identifier                  = var.db_identifier
  engine                      = var.db_engine
  engine_version              = var.db_engine_version
  instance_class              = var.db_instance_class
  username                    = var.db_username
  manage_master_user_password = true

  db_subnet_group_name   = aws_db_subnet_group.this.name
  vpc_security_group_ids = [aws_security_group.db_sg.id]

  backup_retention_period = var.db_backup_retention_period
  backup_window           = var.backup_window
  maintenance_window      = var.maintenance_window

  deletion_protection = var.db_deletion_protection
  skip_final_snapshot = var.db_skip_final_snapshot

  publicly_accessible = false
}