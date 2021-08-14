#variable key_name { }

variable "node" {
  description = "node map"
  type        = map(any)
  default = {
    node1 = {
      instance_type = "t3.micro",
      env           = "test"
      tags          = "node1",
    },
    node2 = {
      instance_type = "t3.micro",
      env           = "test"
      tags          = "node2",
    },
    node3 = {
      instance_type = "t3.micro",
      env           = "test"
      tags          = "node3",
    },
  }
}
