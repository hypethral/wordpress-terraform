output "db_address" {
  description = "RDS endpoint address"
  value       = aws_db_instance.wordpress.address
}

output "db_name" {
  value = aws_db_instance.wordpress.db_name
}

output "db_username" {
  value = aws_db_instance.wordpress.username
}


