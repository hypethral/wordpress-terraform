output "public_ip" {
  description = "Public IP of the WordPress instance"
  value       = aws_instance.wordpress.public_ip
}

output "instance_id" {
  description = "Instance ID of the WordPress instance"
  value       = aws_instance.wordpress.id
}


