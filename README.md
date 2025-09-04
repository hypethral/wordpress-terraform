# Terraform WordPress Infrastructure

This repository contains Terraform code to provision a complete WordPress environment on AWS.  
It uses **modular infrastructure as code** with separate modules for **EC2**, **RDS**, and **Security Groups**.  

---

## 📂 Project Structure

    .
    ├── backend.tf          # Remote state configuration
    ├── main.tf             # Root module orchestrating all components
    ├── variables.tf        # Input variable definitions
    ├── outputs.tf          # Outputs from the root module
    ├── config/             # Optional config directory
    ├── modules/
    │   ├── EC2/            # EC2 instance for WordPress
    │   ├── RDS/            # RDS database module
    │   └── SECURITY/       # Security groups and networking
    └── terraform.tfvars    # Environment-specific values (excluded from git)

---

## 🚀 Features

- **EC2 module** for hosting WordPress  
- **RDS module** for MySQL database  
- **Security module** for VPC Security Groups  
- Uses **default VPC & subnets** (no custom networking module required)  
- Supports multiple environments (`dev`, `stage`, `prod`) with `.tfvars`  

---

## ⚙️ Prerequisites

- Terraform `>= 1.5`  
- AWS account with access credentials  
- Configured AWS CLI or environment variables:  

    export AWS_ACCESS_KEY_ID=your-key
    export AWS_SECRET_ACCESS_KEY=your-secret
    export AWS_DEFAULT_REGION=us-east-1

---

## 📦 Usage

### 1. Clone the repository
    git clone https://github.com/your-org/terraform-wordpress.git
    cd terraform-wordpress

### 2. Initialize Terraform
    terraform init

### 3. Review and customize variables  
Create a `terraform.tfvars` file (not committed to git):  

    aws_region    = "us-east-1"
    db_name       = "wordpressdb"
    db_username   = "admin"
    db_password   = "ChangeMe123!"
    ami_id        = "ami-1234567890abcdef0"
    instance_type = "t3.micro"
    key_name      = "my-ssh-key"

> 🔒 **Important:** Do not commit `terraform.tfvars` to git. Use `terraform.tfvars.example` for safe sharing.

### 4. Plan and Apply
    terraform plan -var-file="terraform.tfvars"
    terraform apply -var-file="terraform.tfvars"

### 5. Destroy
    terraform destroy -var-file="terraform.tfvars"

---

## 📤 Outputs

After applying, Terraform will output:  

- EC2 Public IP (to access WordPress site)  
- RDS Endpoint (for DB connections)  

---

## 🛑 Notes & Best Practices

- Never commit `.tfstate`, `.tfvars`, or `.terraform/` directories.  
- Use remote backends (e.g., S3 + DynamoDB) for team collaboration.  
- Use `user_data` for EC2 bootstrapping instead of provisioners where possible.  
- Rotate database passwords regularly.  

---

## 📜 License
MIT License. Free to use and adapt.
