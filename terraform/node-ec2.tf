#resource "tls_private_key" "define_key" {
#  algorithm = "RSA"
#  rsa_bits  = 4096
#}
#resource "aws_key_pair" "deployer" {
#  key_name   = var.key_name
#  public_key = tls_private_key.define_key.public_key_openssh
#}

resource "aws_key_pair" "deployer" {
  key_name   = "node-pilot.pub"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQD3F6tyPEFEzV0LX3X8BsXdMsQz1x2cEikKDEY0aIj41qgxMCP/iteneqXSIFZBp5vizPvaoIR3Um9xK7PGoW8giupGn+EPuxIA4cDM4vzOqOkiMPhz5XK0whEjkVzTo4+S0puvDZuwIsdiW9mxhJc7tgBNL0cYlWSYVkz4G/fslNfRPW5mYAM49f4fhtxPb5ok4Q2Lg9dPKVHO/Bgeu5woMc7RY0p1ej6D4CKFE6lymSDJpW0YHX/wqE9+cfEauh7xZcG0q9t2ta6F6fmX0agvpFyZo8aFbXeUBr7osSCJNgvavWbM/06niWrOvYX2xwWdhXmXSrbX8ZbabVohBK41 email@example.com"
}

resource "aws_instance" "node" {
  ami = "ami-02762e3af2996d937" #https://cloud-images.ubuntu.com/locator/
  associate_public_ip_address = true

  for_each = var.node

  key_name      = "${each.key}-${each.value.env}"
  instance_type = each.value.instance_type
  tags = {
    Name = "${each.value.tags}"
  }
}