resource "aws_db_instance" "wordpress" {
  identifier          = "wordpress"
  allocated_storage   = 20
  engine              = "mysql"
  engine_version      = "8.0"
  instance_class      = "db.t3.micro"

  db_name   = var.db_name
  username  = var.db_username
  password  = var.db_password

  skip_final_snapshot = true
  publicly_accessible = true

  vpc_security_group_ids = [var.vpc_sg_id]
}
