resource "aws_key_pair" "pk" {
  key_name   = var.name_public_key
  public_key = file(var.public_key)
}


resource "aws_instance" "node" {
  ami                         = "ami-02762e3af2996d937" #https://cloud-images.ubuntu.com/locator/
  key_name                    = aws_key_pair.pk.key_name
  associate_public_ip_address = true
  for_each                    = var.node

  instance_type = each.value.instance_type
  tags = {
    Name = "${each.value.tags}"
  }
}
