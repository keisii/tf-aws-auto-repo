output "vpc_id" {
  value = aws_vpc.project-vpc.id
}

output "subnet01_id" {
  value = aws_subnet.project-public-subnet01.id
}

output "subnet02_id" {
  value = aws_subnet.project-public-subnet02.id
}

output "subnet03_id" {
  value = aws_subnet.project-private-subnet01.id
}

output "subnet04_id" {
  value = aws_subnet.project-private-subnet02.id
}

output "subnet05_id" {
  value = aws_subnet.project-private-subnet03.id
}

output "subnet06_id" {
  value = aws_subnet.project-private-subnet04.id
}

output "igw_id" {
  value = aws_internet_gateway.project-igw.id
}

output "ngw_id" {
  value = aws_nat_gateway.project-ngw.id
}
