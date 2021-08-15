output "node_public_ip" {
  value = { for k, nodes in aws_instance.node : k => nodes.public_ip }
}

output "pub_ssh_key_name" {
  value = aws_key_pair.pk.key_name
}
