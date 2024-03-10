resource "aws_vpc" "todoapp-vpc" {
  cidr_block = "10.0.0.0/16"
  instance_tenancy = "default"

  tags={
    Name = "todoapp-vpc"
  }  

}

resource "aws_subnet" "todoapp-subnet-public" {

  vpc_id     = aws_vpc.todoapp-vpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-east-1a"

  tags ={
    Name = "todoapp-subnet-public"
  }
}

resource "aws_subnet" "todoapp-subnet-private" {

  vpc_id     = aws_vpc.todoapp-vpc.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "us-east-1a"

  tags ={
    Name = "todoapp-subnet-private"
  }
}
resource "aws_eip" "todoapp-eip" {
  domain = "vpc"
}
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.todoapp-vpc.id
  
  tags = {
    Name = "igw"
  }
}

resource "aws_nat_gateway" "todoapp-nat-gw" {
  subnet_id = aws_subnet.todoapp-subnet-public.id
  allocation_id = aws_eip.todoapp-eip.id
  depends_on = [ aws_internet_gateway.igw ]
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

resource "aws_route_table" "todoapp-rt" {
  vpc_id = aws_vpc.todoapp-vpc.id
route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.todoapp-nat-gw.id
  }
}
resource "aws_route_table_association" "todoapp-rt-association" {
  subnet_id = aws_subnet.todoapp-subnet-private.id
  route_table_id = aws_route_table.todoapp-rt.id
  
}