sudo apt install -y apache2
sudo systemctl enable apache2
sudo mkdir /var/www/html/backend1
sudo echo "Welcome to backend 1" > /var/www/html/backend1/page.html
sudo systemctl restart apache2
