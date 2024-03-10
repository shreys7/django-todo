resource "aws_default_network_acl" "todoapp-nacl" { #NACL
  default_network_acl_id = aws_vpc.todoapp-vpc.default_network_acl_id

  ingress {
    protocol   = -1
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  egress {
    protocol   = -1
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }
}

resource "aws_default_security_group" "todoapp-sg" { #SECURITY-GROUP
  vpc_id = aws_vpc.todoapp-vpc.id


  ingress {
    protocol  = -1
    self      = true
    from_port = 0
    to_port   = 0
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
data "aws_key_pair" "todoapp-key" {
  key_name           = "todoapp-key"
  include_public_key = true
}