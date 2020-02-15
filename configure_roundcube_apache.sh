#!/bin/sh

cd /etc/tmp/

wget https://github.com/roundcube/roundcubemail/releases/download/1.4.2/roundcubemail-1.4.2-complete.tar.gz
tar xvf roundcubemail-1.4.2-complete.tar.gz

sudo mkdir /var/www/

sudo mv roundcubemail-1.4.2 /var/www/roundcube

sudo dnf install -y https://rpms.remirepo.net/enterprise/remi-release-8.rpm

sudo dnf module reset php

sudo dnf module enable php:remi-7.4 -y

sudo dnf module enable mysqld

sudo dnf install -y mysql mysql-server httpd php-ldap php-imagick php-common php-gd php-imap php-json php-curl php-zip php-xml php-mbstring php-bz2 php-intl php-gmp

systemctl enable --now httpd

mysql -u root <<EOF

CREATE DATABASE roundcube DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;

CREATE USER roundcubeuser@localhost IDENTIFIED BY 'password';

GRANT ALL PRIVILEGES ON roundcube.* TO roundcubeuser@localhost;

flush privileges;

EOF

mysql -u root roundcube < /var/www/roundcube/SQL/mysql.initial.sql

echo -e "<VirtualHost *:80>
  ServerName mail.your-domain.com
  DocumentRoot /var/www/roundcube/

  ErrorLog /var/log/httpd/roundcube_error.log
  CustomLog /var/log/httpd/roundcube_access.log combined

  <Directory />
    Options FollowSymLinks
    AllowOverride All
  </Directory>

  <Directory /var/www/roundcube/>
    Options FollowSymLinks MultiViews
    AllowOverride All
    Order allow,deny
    allow from all
  </Directory>

</VirtualHost>" > /etc/httpd/conf.d/roundcube.conf

sudo systemctl reload httpd

sudo chcon -t httpd_sys_content_t /var/www/roundcube/ -R

sudo chcon -t httpd_sys_rw_content_t /var/www/roundcube/temp/ /var/www/roundcube/logs/ -R

sudo setfacl -R -m u:apache:rwx /var/www/roundcube/temp/ /var/www/roundcube/logs/

sudo setsebool -P httpd_can_network_connect 1

sudo systemctl restart httpd


