resource "aws_instance" "todoapp-web" {
  subnet_id = aws_subnet.todoapp-subnet-public.id
  depends_on = [ aws_default_security_group.todoapp-sg ]
  associate_public_ip_address = true

  ami           = "ami-053b0d53c279acc90" #Ubuntu 22.04
  instance_type = "t2.medium"
  key_name = data.aws_key_pair.todoapp-key.key_name
  
  tags = {
    Name = "todoApp-dev"
  }
  user_data = "${file("docker-install.sh")}"
}


resource "aws_instance" "todoapp-jenkins" {
  subnet_id = aws_subnet.todoapp-subnet-public.id
  depends_on = [ aws_default_security_group.todoapp-sg ]
  associate_public_ip_address = true

  ami = "ami-053b0d53c279acc90"
  instance_type = "t2.medium"
  key_name = data.aws_key_pair.todoapp-key.key_name
  user_data = "${file("jenkins-install.sh")}"
    tags = {
    Name = "todoApp-jenkins"
  }

}
