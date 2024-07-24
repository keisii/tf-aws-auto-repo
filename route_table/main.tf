resource "aws_route_table" "project-web-rt" {

  vpc_id = var.vpc_id

  route {
    cidr_block = "0.0.0.0/0" 
    gateway_id = var.igw_id
  }

  tags = {
    Name = "public-web-route-table"
  }
}

resource "aws_route_table_association" "project-web-rta01" {
  subnet_id = var.subnet01_id
  route_table_id = aws_route_table.project-web-rt.id
}

resource "aws_route_table_association" "project-web-rta02" {
  subnet_id = var.subnet02_id
  route_table_id = aws_route_table.project-web-rt.id
}

resource "aws_route_table" "project-app-rt" {
  vpc_id = var.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.ngw_id
  }
  
  tags = {
    Name = "private-app-route-table"
  }
}

resource "aws_route_table_association" "project-app-rta01" {
  subnet_id = var.subnet03_id
  route_table_id = aws_route_table.project-app-rt.id
}

resource "aws_route_table_association" "project-app-rta02" {
  subnet_id = var.subnet04_id
  route_table_id = aws_route_table.project-app-rt.id
}

resource "aws_route_table_association" "project-app-rta03" {
  subnet_id = var.subnet05_id
  route_table_id = aws_route_table.project-app-rt.id
}

resource "aws_route_table" "project-db-rt" {
  vpc_id = var.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.ngw_id
  }

  tags = {
    Name = "private-db-route-table"
  }
}

resource "aws_route_table_association" "project-db-rta01" {
  subnet_id = var.subnet06_id
  route_table_id = aws_route_table.project-db-rt.id
}
