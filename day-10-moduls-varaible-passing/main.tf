resource "aws_instance" "sam" {
    ami = var.ami_id
    instance_type = var.instance_type
  
}