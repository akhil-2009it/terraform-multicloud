#! /bin/bash
sudo apt-get update
sudo apt-get install -y apache2
sudo systemctl start apache2
sudo systemctl enable apache2
echo "<h3>*****************8welcome to MultiCloud Demo Google Cloud****************</h3>" | sudo tee /var/www/html/index.html