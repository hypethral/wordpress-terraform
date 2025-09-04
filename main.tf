provider "aws" {
  region = var.aws_region
}

# Data sources for default VPC and subnets (if needed later)
data "aws_vpc" "default" {
  default = true
}

# Security module
module "security" {
  source = "./modules/SECURITY"
  vpc_id = data.aws_vpc.default.id
  
}

# RDS module
module "rds" {
  source      = "./modules/RDS"
  db_name     = var.db_name
  db_username = var.db_username
  db_password = var.db_password
  vpc_sg_id   = module.security.rds_sg_id
}

# EC2 module
module "ec2" {
  source        = "./modules/EC2"
  ami_id        = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name
  vpc_sg_id     = module.security.web_sg_id
  db_host       = module.rds.db_address
  db_name       = var.db_name
  db_username   = var.db_username
  db_password   = var.db_password
}
