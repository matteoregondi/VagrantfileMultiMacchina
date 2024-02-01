sudo apt-get update
sudo apt-get upgrade
sudo apt-get install -y apache2 php php-{cli,mysql,xml,mbstring,zip,fpm}
apt-get install -y php libapache2-mod-php php-mysql
sudo systemctl restart apache2
wget http://sqlbuddy.com/sqlbuddy-latest.zip
unzip sqlbuddy-latest.zip
sudo mv sqlbuddy /var/www/html/sqlbuddy
sudo chown -R www-data:www-data /var/www/html/sqlbuddy
echo '127.0.0.1       sqlbuddy.test' | sudo tee -a /etc/hosts
sudo loadkeys ch


