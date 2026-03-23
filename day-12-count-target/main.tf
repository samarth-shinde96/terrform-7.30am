resource "aws_instance" "name" {
    ami           = "ami-02dfbd4ff395f2a1b"
    instance_type = "t2.micro"
    count = var.dev ? 1 : 0
  
}
variable "dev" {
    type = bool
    default = true
    
  
}
#if dev is true then create 1 instance otherwise create 0 instance