resource "aws_instance" "todoapp-dev-test" {
  subnet_id = aws_subnet.todoapp-subnet.id
  depends_on = [ aws_default_security_group.todoapp-sg ]
  associate_public_ip_address = true

  ami           = "ami-053b0d53c279acc90" #Ubuntu 22.04
  instance_type = "t2.micro"
  key_name = var.ec2-key
  
  tags = {
    Name = "todoApp-dev-test"
  }
  user_data = <<EOF
  #!/bin/bash
  mkdir test
  EOF
}

resource "aws_instance" "todoapp-jenkins" {
  subnet_id = aws_subnet.todoapp-subnet.id
  depends_on = [ aws_default_security_group.todoapp-sg ]
  associate_public_ip_address = true

  ami = "ami-053b0d53c279acc90"
  instance_type = "t2.micro"
  key_name = var.ec2-key
  
  tags = {
    Name = "todoApp-dev-jenkins"
  }

}