resource "aws_vpc" "name" {
    cidr_block = "10.0.0.0/24"
    tags = {
      Name = "sam"
    }
  
}
  
resource "aws_instance" "samarth" {
    ami = "ami-02dfbd4ff395f2a1b"
    instance_type = "t2.micro"
    tags = {
      Name = "samarth"
    }
  
}
resource "aws_ec2_instance_state" "name" {
    instance_id = aws_instance.samarth.id
    state = "running"
    depends_on = [ aws_instance.samarth ]
}