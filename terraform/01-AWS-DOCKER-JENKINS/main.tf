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
  user_data =<<EOF
#!/bin/bash
sudo apt update -y
sudo apt install openjdk-17-jre -y
java -version
curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | sudo tee \
  /usr/share/keyrings/jenkins-keyring.asc > /dev/null
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null
sudo apt-get update -y
sudo apt-get install jenkins -y

  EOF
  tags = {
    Name = "todoApp-dev-jenkins"
  }

}