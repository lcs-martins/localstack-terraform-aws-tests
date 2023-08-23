
resource "aws_instance" "node" {
  ami                         = "ami-02762e3af2996d937" #https://cloud-images.ubuntu.com/locator/
  associate_public_ip_address = true
  for_each                    = var.node

  instance_type = each.value.instance_type
  tags = {
    Name = "${each.value.tags}"
  }
}
