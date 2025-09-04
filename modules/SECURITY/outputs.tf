output "web_sg_id" {
  description = "Security group ID for web/ssh access"
  value       = aws_security_group.wp_sg.id
}

output "rds_sg_id" {
  description = "Security group ID for database access"
  value       = aws_security_group.wp_sg.id
}


