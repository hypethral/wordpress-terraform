terraform {
  backend "s3" {
    bucket         = "arslan-terraform"
    key            = "wordpress/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform"
    encrypt        = true
  }
}