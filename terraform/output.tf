output "node_public_ip" {
  value = { for k, nodes in aws_instance.node : k => nodes.public_ip }
}