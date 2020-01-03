#! /bin/bash
sudo apt-get update
sudo apt-get install -y apache2
sudo a2enmod rewrite
sudo a2enmod ssl
sudo systemctl start apache2
sudo systemctl enable apache2
sudo git config --global user.name "praveen-edulakanti"
sudo git config --global user.email "praveen.edulakanti@gmail.com"
sudo mkdir /var/www/html/dashboard
sudo git clone https://github.com/praveen-edulakanti/dashboard.git /var/www/html/dashboard
#echo "<h1>Deployed via Terraform-Apache Private Instance 1</h1>" | sudo tee /var/www/html/index.html