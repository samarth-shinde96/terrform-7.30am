module "sam" {
    source = "../day-10-moduls-varaible-passing"
    ami_id = "ami-02dfbd4ff395f2a1b"
    instance_type = "t2.micro"
}