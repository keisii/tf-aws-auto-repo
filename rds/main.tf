resource "aws_db_subnet_group" "project-db-sg" {
  name = "project-db-sg"
  description = "DB Subnet Group"
  subnet_ids = [var.subnet05_id, var.subnet06_id]
}

resource "aws_db_parameter_group" "project-db-pg" {
  name   = "project-db-pg"
  family = "mysql8.0"
}

resource "aws_db_instance" "project-primary-rds-instance" {
  identifier = "project-primary-rds-instance"
  instance_class = "db.t3.micro"
  allocated_storage = 5
  engine = "mysql"
  engine_version = "8.0.35"
  username = "admin"
  password = "Admin1234!"
  db_subnet_group_name = aws_db_subnet_group.project-db-sg.name
  vpc_security_group_ids = [var.db_security_group_id]
  parameter_group_name   = aws_db_parameter_group.project-db-pg.name
  skip_final_snapshot = true
  multi_az = true
  apply_immediately = true
  backup_retention_period = 1
}

resource "aws_db_instance" "project-replica-rds-instance" {
  identifier = "project-replica-rds-instance"
  instance_class = "db.t3.micro"
  replicate_source_db = aws_db_instance.project-primary-rds-instance.identifier
  vpc_security_group_ids = [var.db_security_group_id]
  parameter_group_name = aws_db_parameter_group.project-db-pg.name
  skip_final_snapshot = true
  multi_az = true
  apply_immediately = true
}
