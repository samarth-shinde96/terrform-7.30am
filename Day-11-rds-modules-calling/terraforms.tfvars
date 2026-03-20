environment = "dev"

vpc_cidr    = "10.0.0.0/16"
subnet_cidr = "10.0.1.0/24"
subnet_az   = "us-east-1a"

allowed_cidr_blocks = ["0.0.0.0/0"]

db_subnet_group_name = "dev-db-subnet"

db_instance_class = "db.t3.micro"
db_username       = "admin"