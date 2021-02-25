sudo apt install apache2 -y
sudo echo "Hello from $HOSTNAME" > /var/www/html/index.html
sudo systemctl enable apache2
