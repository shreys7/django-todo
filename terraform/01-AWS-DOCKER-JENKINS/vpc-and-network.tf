resource "aws_vpc" "todoapp-vpc" {
  cidr_block = "10.0.0.0/16"
  instance_tenancy = "default"

  tags={
    Name = "todoapp-vpc"
  }  

}

resource "aws_subnet" "todoapp-subnet" {

  vpc_id     = aws_vpc.todoapp-vpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-east-1a"

  tags ={
    Name = "todoapp-subnet"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.todoapp-vpc.id

  tags = {
    Name = "igw"
  }
}

resource "aws_default_route_table" "todoapp-route-table" {
  default_route_table_id = aws_vpc.todoapp-vpc.default_route_table_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    Name = "todoapp-route-table"
  }
}

