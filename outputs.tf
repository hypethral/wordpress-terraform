output "ec2_public_ip" {
  description = "Public IP of the WordPress EC2"
  value       = module.ec2.public_ip
}

output "rds_endpoint" {
  description = "RDS endpoint for WordPress DB"
  value       = module.rds.db_address
}