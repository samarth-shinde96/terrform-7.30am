resource "aws_instance" "dev" {
    ami           = "ami-02dfbd4ff395f2a1b"
    instance_type = "t2.micro"
    tags = {
        Name = "dev-instance"
    }
    lifecycle {
    create_before_destroy = true
    }

      lifecycle {
        ignore_changes = [ tags ]

        lifecycle {
          prevent_destroy = true
        }
      }
}

  
