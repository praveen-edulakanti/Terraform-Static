#! /bin/bash
sudo apt-get update
sudo apt-get install -y apache2
sudo a2enmod rewrite
sudo a2enmod ssl
sudo systemctl start apache2
sudo systemctl enable apache2
sudo mkdir /var/www/html/user
sudo mkdir /var/www/html/dashboard
sudo git clone https://github.com/praveen-edulakanti/user.git /var/www/html/user
sudo git clone https://github.com/praveen-edulakanti/dashboard.git /var/www/html/dashboard
echo "<h1>Deployed via Terraform-Apache Public Instance 1</h1>" | sudo tee /var/www/html/index.html