#! /bin/bash
sudo apt-get update
sudo apt-get install -y apache2
sudo a2enmod rewrite
sudo a2enmod ssl
sudo systemctl start apache2
sudo systemctl enable apache2
sudo mkdir /var/www/html/user
sudo git clone https://github.com/praveen-edulakanti/user.git /var/www/html/user
#echo "<h1>Deployed via Terraform-Apache Private Instance 2</h1>" | sudo tee /var/www/html/index.html