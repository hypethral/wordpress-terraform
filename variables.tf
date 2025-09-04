variable "aws_region" {
  description = "AWS region"
  type        = string
}

variable "ami_id" {
  description = "AMI ID for EC2"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "key_name" {
  description = "EC2 key pair name"
  type        = string
}

variable "db_name" {
  description = "WordPress database name"
  type        = string
}

variable "db_username" {
  description = "WordPress database username"
  type        = string
}

variable "db_password" {
  description = "WordPress database password"
  type        = string
  sensitive   = true
}