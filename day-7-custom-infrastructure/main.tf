resource "aws_vpc" "my-vpc" {
    cidr_block = "10.0.0.0/16"
    tags = {
      Name = "sam"

    }
  
}
resource "aws_subnet" "public_subnet" {
    vpc_id = aws_vpc.my-vpc.id
    cidr_block = "10.0.0.0/24"
    availability_zone = "us-east-1a"
    tags = {
      Name = "public-subnet"
    }
  
}
resource "aws_subnet" "private_subnet" {
    vpc_id = aws_vpc.my-vpc.id
    cidr_block = "10.0.1.0/24"
    availability_zone = "us-east-1a"
    tags = {
      Name = "private-subnet"
    }
}
 
  resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.my-vpc.id
    tags = {
      Name = "my-igw"
    }
    
  }
resource "aws_eip" "nat-eip" {
    domain = "vpc"
  
}
resource "aws_nat_gateway" "nat" {
    allocation_id = aws_eip.nat-eip.id
    subnet_id = aws_subnet.public_subnet.id
    tags = {
      Name = "my-nat-gateway"
    }
  
}
resource "aws_route_table" "public-route-table" {
    vpc_id = aws_vpc.my-vpc.id
    route {
      cidr_block = "0.0.0.0/0"
      gateway_id = aws_internet_gateway.igw.id
    }
    
  
}
  resource "aws_route_table_association" "rt_assosiation" {
    subnet_id = aws_subnet.public_subnet.id
    route_table_id = aws_route_table.public-route-table.id
    
  }
resource "aws_route_table" "private_route_table" {
    vpc_id = aws_vpc.my-vpc.id
    route { 
      cidr_block = "0.0.0.0/0"
      gateway_id = aws_nat_gateway.nat.id
    }
}
    resource "aws_route_table_association" "private_rt_association" {
    subnet_id = aws_subnet.private_subnet.id
    route_table_id = aws_route_table.private_route_table.id
      
    }
    resource "aws_security_group" "sg" {
    name = "my-security-group"
    description = "Allow SSH and HTTP traffic"
    vpc_id = aws_vpc.my-vpc.id

    ingress {
      from_port = 22
      to_port = 22
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
      from_port = 80
      to_port = 80
      protocol = "http"
    }
    egress {
      from_port = 0
      to_port = 0
      protocol = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
  resource "aws_instance" "shinde" {
    ami = "ami-02dfbd4ff395f2a1b"
    instance_type = "t3.micro"
    subnet_id = aws_subnet.public_subnet.id
    vpc_security_group_ids =   [aws_security_group.sg.id]
    tags = {
      Name = "samarth"
    }
    
  }