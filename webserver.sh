#!/bin/bash
clear
echo "**************************************************"
echo " Tugas Administrasi Sistem Server			"
echo " Nama	: Rizky Hermawan			"
echo " NIM	: 195150209111002                       "
echo "**************************************************"
sleep 2

echo " Update Ubuntu "
sudo apt update && sudo apt upgrade -y

echo "Instalasi Paket yang dibutuhkan"
sudo apt-get install -y software-properties-common apt-transport-https lsb-release ca-certificates \
                                                bash-completion consolekit libexpat1-dev gettext libz-dev \
                                                gnupg-curl build-essential libssl-dev libcurl4-gnutls-dev \
                                                zip unzip git-all vim htop dirmngr

echo "Instalasi Apache2"
sudo apt install apache2

echo "Cek Status Apache2"
sudo systemctl status apache2
sleep 2
sudo mkdir /home/ubuntu/log

echo "Clone Github"
sudo git clone https://github.com/rizherm21/adser_selfpaced.git

echo "Create Virtual Host"
sudo mkdir /var/www/bash
sudo chown -R root:root /var/www/bash
sudo chmod -R 755 /var/www/bash
sudo cp /home/ubuntu/adser_selfpaced/index.html /var/www/bash/
sudo cp /home/ubuntu/adser_selfpace/default.conf /etc/apache2/sites-available/
sudo a2dissite 000-default
sudo a2ensite default
sudo apache2ctl configtest
sudo systemctl restart apache2
sudo systemctl status apache2
sleep 2