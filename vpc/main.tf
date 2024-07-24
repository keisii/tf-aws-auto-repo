resource "aws_vpc" "project-vpc" {
  cidr_block = "192.168.0.0/16"
  tags = {
    Name = "project-vpc"
  }
}

resource "aws_subnet" "project-public-subnet01" {
  vpc_id = aws_vpc.project-vpc.id
  availability_zone = "ap-northeast-2a"
  cidr_block = "192.168.0.0/24"
  
  tags = {
    Name = "public-web-a"
  }
}

resource "aws_subnet" "project-public-subnet02" {
  vpc_id = aws_vpc.project-vpc.id
  availability_zone = "ap-northeast-2c"
  cidr_block = "192.168.1.0/24"

  tags = {
    Name = "public-web-c"
  }
}

resource "aws_subnet" "project-private-subnet01" {
  vpc_id = aws_vpc.project-vpc.id
  availability_zone = "ap-northeast-2a"
  cidr_block = "192.168.2.0/24"

  tags = {
    Name = "private-app-a"
  }
}

resource "aws_subnet" "project-private-subnet02" {
  vpc_id = aws_vpc.project-vpc.id
  availability_zone = "ap-northeast-2c"
  cidr_block = "192.168.3.0/24"

  tags = {
    Name = "private-app-c"
  }
}

resource "aws_subnet" "project-private-subnet03" {
  vpc_id = aws_vpc.project-vpc.id
  availability_zone = "ap-northeast-2a"
  cidr_block = "192.168.4.0/24"

  tags = {
    Name = "private-db-a"
  }
}

resource "aws_subnet" "project-private-subnet04" {
  vpc_id = aws_vpc.project-vpc.id
  availability_zone = "ap-northeast-2c"
  cidr_block = "192.168.5.0/24"

  tags = {
    Name = "private-db-c"
  }
}

resource "aws_internet_gateway" "project-igw" {
  vpc_id = aws_vpc.project-vpc.id

  tags = {
    Name = "project-igw"

  }
}

resource "aws_eip" "project-eip" {
  domain = "vpc"

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_nat_gateway" "project-ngw" {
  allocation_id = aws_eip.project-eip.id
  subnet_id = aws_subnet.project-public-subnet01.id

  tags = {
    Name = "project-ngw"
  }
}
