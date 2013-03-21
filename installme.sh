#!/bin/bash

echo "====================================="
echo "Updating the system..(Required)"
echo "===================================="

sudo apt-add-repository ppa:chris-lea/node.js
sudo apt-get -y update

echo "====================================="
echo "Installing Dependenciecs :: "
echo "zlib1g-dev libssl-dev libreadline-dev libyaml-dev libcurl4-openssl-dev curl git-core python-software-properties libsqlite3-dev nodejs"
echo "======================================"

sudo apt-get -y install build-essential zlib1g-dev libssl-dev libreadline-dev libyaml-dev libcurl4-openssl-dev curl git-core python-software-properties libsqlite3-dev nodejs


echo "====================================="
echo "Installing MySQL"
echo "====================================="

sudo apt-get -y install mysql-server mysql-client libmysqlclient-dev

echo "====================================="
echo "GETTING RUBY"
echo "====================================="


sudo wget ftp://ftp.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p392.tar.gz
sudo tar -xvzf ruby-1.9.3-p392.tar.gz
sudo cd ruby-1.9.3-p392/
./configure

echo "====================================="
echo "MAKING RUBY and INSTALLING RUBY"
echo "====================================="

sudo make
sudo make install
echo "gem: --no-ri --no-rdoc" >> ~/.gemrc
sudo gem install bundler
sudo gem install rails

echo "====================================="
echo "INSTALLING PASSENGER AND NGINX"
echo "====================================="

sudo gem install passenger
sudo passenger-install-nginx-module --auto --prefix=/opt/nginx --auto-download

echo "====================================="
echo "CONFIGURING AND HOUSEKEEPING"
echo "====================================="

wget -O init-deb.sh http://library.linode.com/assets/660-init-deb.sh
sudo mv init-deb.sh /etc/init.d/nginx
sudo chmod +x /etc/init.d/nginx
sudo /usr/sbin/update-rc.d -f nginx defaults

echo "====================================="
echo "PHP and some MYSQL"
echo "====================================="

sudo apt-get -y install mysql-server
sudo apt-get -y install php5-cli php5-cgi php5-common php5-curl php5-dev php5-gd php5-mcrypt php5-mhash
sudo apt-get -y install php5-mysql libmysqld-dev
sudo apt-get -y install php5-fpm

echo "======================================="
echo "================DONE==================="
echo "======================================="

echo "use following command to start/stop/restart nginx ... "
echo "======================================="


echo "/etc/init.d/nginx start"
echo "/etc/init.d/nginx stop"
echo "/etc/init.d/nginx reload"
echo "/etc/init.d/nginx restart"

echo "======================================="

echo "Configure your file at /opt/nginx/conf/nginx.conf "
echo "----------------------------------------------------"
echo "----------------------------------------------------"

echo "Written by Megh Suthar. Special Thanks to Linode and Stackoverflow."

