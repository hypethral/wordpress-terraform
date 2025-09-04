variable "ami_id" {
  description = "AMI ID for the WordPress EC2 instance"
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

variable "vpc_sg_id" {
  description = "Security group ID to attach to the instance"
  type        = string
}

variable "db_host" {
  description = "Database host address"
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


