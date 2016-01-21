#!/usr/bin/env bash

# First off, let's install the required software
apt-get update
apt-get install -y apache2 php5 libapache2-mod-php5 php5-cli php5-mysql php5-gd
debconf-set-selections <<< 'mysql-server-<5.5> mysql-server/root_password password my-password'
debconf-set-selections <<< 'mysql-server-<5.5> mysql-server/root_password_again password my-password'
apt-get install mysql-server mysql-client libmysqlclient-dev -y

# Create a database
mysql --user=root --password=root < /vagrant/stack/local_db.sql

# Get the config files going
cp /vagrant/stack/local-virtualhost.conf /etc/apache2/sites-available/my-project.conf
cp /vagrant/stack/local-htaccess.conf /vagrant/.htaccess

# Make sure log folder exists
mkdir /vagrant/logs

# Point everything in the right direction
rm -rf /var/www
ln -fs /vagrant /var/www

# Make sure apache handles our stuff
a2enmod headers
a2enmod rewrite
a2ensite my-project

# Restart for good measure
service apache2 restart -y

# Set /et/hosts
sudo -- sh -c "echo '127.0.0.1 my-project.sim' >> /etc/hosts"
