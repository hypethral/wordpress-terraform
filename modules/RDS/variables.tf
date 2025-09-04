variable "db_name" {
  description = "Database name for WordPress"
  type        = string
}

variable "db_username" {
  description = "Database username for WordPress"
  type        = string
}

variable "db_password" {
  description = "Database password for WordPress"
  type        = string
  sensitive   = true
}

variable "vpc_sg_id" {
  description = "Security group for RDS"
  type        = string
}
