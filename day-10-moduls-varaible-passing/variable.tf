variable "ami_id" {
    default = ""
}
variable "instance_type" {
    default = ""
}
variable "security_group_ids" {
    description = ""
    type = string
    default = "my_security_group"
}
variable "ssh_cidr" {
  description = "cidr for ssh"
  type = string
  default = "0.0.0.0/0"
}
variable "http-cidr" {
  description = "cidr for http"
  type = string
  default = "0.0.0.0/0"
}
variable "subnet_id" {
  description = "ID of the subnet"
  type = string
}