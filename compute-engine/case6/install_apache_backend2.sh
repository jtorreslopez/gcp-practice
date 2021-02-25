sudo apt install -y apache2
sudo systemctl enable apache2
sudo mkdir /var/www/html/backend2
sudo echo "Welcome to backend 2" > /var/www/html/backend2/page.html
sudo systemctl restart apache2
