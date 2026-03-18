resource "aws_instance" "name" {
    ami = var.ami_id
    instance_type = var.instance_type
    subnet_id = var.subnet_id
    tags = {
      Name = "my-ec2-instance"
    }
  
}
resource "aws_security_group" "name" {
  name = var.security_group_ids



ingress {
  from_port = 22
  to_port = 22
  protocol = "tcp"
  cidr_blocks = [var.ssh_cidr]
}

ingress {
  from_port = 80
  to_port = 80
  protocol = "tcp"
  cidr_blocks = [var.http-cidr]
}
egress {
  from_port = 0
  to_port = "0"
  protocol = "-1"
  cidr_blocks = ["0.0.0.0/0"]
}
}
