# resource "aws_security_group" "wordpress" {
#   name        = "wordpress"
#   description = "this is using for securitygroup"
#   vpc_id      = var.vpcid

#   ingress {
#     description = "this is inbound rule"
#     from_port   = 22
#     to_port     = 22
#     protocol    = "tcp"
#     cidr_blocks = ["45.249.77.103/32"]
#   }
# #   ingress {
# #     description     = "this is inbound rule"
# #     from_port       = 22
# #     to_port         = 22
# #     protocol        = "tcp"
# #     security_groups = ["${aws_security_group.bastion.id}"]
# #   }
#   ingress {
#     description = "this is inbound rule"
#     from_port   = 80
#     to_port     = 80
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   ingress {
#     description = "this is inbound rule"
#     from_port   = 80
#     to_port     = 80
#     protocol    = "tcp"
#     security_groups = ["${aws_security_group.siva-alb-sg.id}"]
#   }
# #   ingress {
# #     description = "this is inbound rule"
# #     from_port   = 9100
# #     to_port     = 9100
# #     protocol    = "tcp"
# #     cidr_blocks = ["0.0.0.0/0"]
# #   }
#   egress {
#     from_port        = 0
#     to_port          = 0
#     protocol         = "-1"
#     cidr_blocks      = ["0.0.0.0/0"]
#     ipv6_cidr_blocks = ["::/0"]
#   }

#   tags = {
#     Name = "wordpress"
#   }
# }
# # #apacheuserdata
# # data "template_file" "wordpresuser" {
# #   template = file("/c/module/RDS/test.sh")

# # }
# # apache instance
# resource "aws_instance" "php-wordpress" {
#   ami                    = var.ami
#   instance_type          = var.type
#   subnet_id              = var.pubsubnet1
#   vpc_security_group_ids = [aws_security_group.wordpress.id]
#   key_name               ="lamp"
#   # user_data              = file("test.sh")
#      user_data = <<EOF
#              #!/bin/bash
# sudo apt-get update -y
# sudo apt-get install apache2 -y
# sudo apt-get install mysql-server -y
# sudo apt-get install php libapache2-mod-php php-mysql -y
# cat <<EOT>> /var/www/html/info.php
# <?php
# phpinfo();
# ?>
# EOT
# mysql -h terraform-20230405091117562800000001.ct8tbbndzf1w.eu-north-1.rds.amazonaws.com-u sivadev -p 
# sriram2662
# create database wordpress;
# CREATE USER 'username'@'terraform-20230405091117562800000001.ct8tbbndzf1w.eu-north-1.rds.amazonaws.com' IDENTIFIED BY 'cQB20y&i0w1c';
# GRANT ALL PRIVILEGES ON wordpress.* TO 'username'@'terraform-20230405091117562800000001.ct8tbbndzf1w.eu-north-1.rds.amazonaws.com';
# FLUSH PRIVILEGES;
# cd /tmp && wget https://wordpress.org/latest.tar.gz
# tar -xvf latest.tar.gz
# cp -R wordpress /var/www/html/
# chown -R www-data:www-data /var/www/html/wordpress/
# chmod -R 755 /var/www/html/wordpress/
# mkdir /var/www/html/wordpress/wp-content/uploads
# chown -R www-data:www-data /var/www/html/wordpress/wp-content/uploads/
#        EOF
#   tags = {
#     Name = "wordpress"
#   }
# }
# resource "aws_lb_target_group" "siva-tg-wordpress" {
#   name     = "wordpress"
#   port     = 80
#   protocol = "HTTP"
#   vpc_id   = var.vpcid
# }


# resource "aws_lb_target_group_attachment" "siva-tg-attachment-wordpress" {
#   target_group_arn = aws_lb_target_group.siva-tg-wordpress.arn
#   target_id        = aws_instance.php-wordpress.id
#   port             = 80
# }



# # alb-listner_rule
# resource "aws_lb_listener_rule" "siva-wordpress-hostbased" {
#   listener_arn = aws_lb_listener.siva-alb-listener.arn
#   #   priority     = 98

#   action {
#     type             = "forward"
#     target_group_arn = aws_lb_target_group.siva-tg-wordpress.arn
#   }

#   condition {
#     host_header {
#       values = ["wordpress.sainath.quest"]
#     }
#   }
# }