resource "aws_instance" "wordpress" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name
  vpc_security_group_ids = [var.vpc_sg_id]

  provisioner "remote-exec" {
      inline = [
        "echo 'Hello' > test"
      ]
  connection {
      type        = "ssh"
      user        = "ubuntu"            # or "ubuntu" depending on AMI
      private_key = file("~/.ssh/terraform.pem")
      host        = self.public_ip
    }
  }

  user_data = <<-EOF
              #!/bin/bash
              apt-get update -y
              apt-get install -y apache2 php php-mysql mysql-client wget unzip

              systemctl enable apache2
              systemctl start apache2

              wget https://wordpress.org/latest.tar.gz -P /tmp
              tar -xvzf /tmp/latest.tar.gz -C /tmp
              rm -rf /var/www/html/*
              cp -r /tmp/wordpress/* /var/www/html/

              chown -R www-data:www-data /var/www/html/
              chmod -R 755 /var/www/html/

              cp /var/www/html/wp-config-sample.php /var/www/html/wp-config.php
              sed -i "s/database_name_here/${var.db_name}/" /var/www/html/wp-config.php
              sed -i "s/username_here/${var.db_username}/" /var/www/html/wp-config.php
              sed -i "s/password_here/${var.db_password}/" /var/www/html/wp-config.php
              sed -i "s/localhost/${var.db_host}/" /var/www/html/wp-config.php

              systemctl restart apache2
              rm -rf /var/www/html/index.html
              EOF
  tags = {
    Name = "WordPress-Server"
  }
}