module "sam" {
    source = "../day-10-moduls-varaible-passing"
    ami_id = "ami-02dfbd4ff395f2a1b"
    instance_type = "t3.micro"
    security_group_ids = "my_security_group"
    ssh_cidr = "0.0.0.0/0"
    http-cidr = "0.0.0.0/0"
    subnet_id = "subnet-00e6eb9e560e0204b"
}
