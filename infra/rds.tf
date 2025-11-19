resource "aws_db_subnet_group" "default" {
  name       = "octabyte-db-subnet-group"
  subnet_ids = [aws_subnet.private.id]
}

resource "aws_db_instance" "postgres" {
  allocated_storage    = 20
  engine               = "postgres"
  engine_version       = "13.7"
  instance_class       = "db.t3.micro"
  name                 = "octabytedb"
  username             = var.db_username
  password             = var.db_password
  db_subnet_group_name = aws_db_subnet_group.default.name
  vpc_security_group_ids = [aws_security_group.app_sg.id]
  skip_final_snapshot  = true
  publicly_accessible  = false
  tags = { Name = "octabyte-postgres" }
}
