#!/bin/bash
sudo apt-get update -y
sudo apt-get install apache2 -y
sudo apt-get install mysql-server -y
sudo apt-get install php libapache2-mod-php php-mysql -y
cat <<EOT>> /var/www/html/info.php
<?php
phpinfo();
?>
EOT
mysql -h database-1.cjfsg4iqveix.ap-southeast-2.rds.amazonaws.com -u siva -p 
cQB20y&i0w1c
create database wordpress;
CREATE USER 'username'@'database-1.cjfsg4iqveix.ap-southeast-2.rds.amazonaws.com' IDENTIFIED BY 'cQB20y&i0w1c';
GRANT ALL PRIVILEGES ON wordpress.* TO 'username'@'database-1.cjfsg4iqveix.ap-southeast-2.rds.amazonaws.com';
FLUSH PRIVILEGES;
cd /tmp && wget https://wordpress.org/latest.tar.gz
tar -xvf latest.tar.gz
cp -R wordpress /var/www/html/
chown -R www-data:www-data /var/www/html/wordpress/
chmod -R 755 /var/www/html/wordpress/
mkdir /var/www/html/wordpress/wp-content/uploads
chown -R www-data:www-data /var/www/html/wordpress/wp-content/uploads/