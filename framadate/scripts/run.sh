#!/bin/bash

cd /var/www

mv /var/www/app/inc/constants.php.template /var/www/app/inc/constants.php
sed -i -e"s/<database type>/mysql/" /var/www/app/inc/constants.php
sed -i -e"s/<www.mydomain.com>/$APP_DOMAINE/" /var/www/app/inc/constants.php
sed -i -e"s/<Application name>/$APP_NAME/" /var/www/app/inc/constants.php
sed -i -e"s/<email address>/$APP_EMAIL/" /var/www/app/inc/constants.php
sed -i -e"s/<no-reply@mydomain.com>/$APP_EMAIL_NO_REPLY/" /var/www/app/inc/constants.php
sed -i -e"s/<database name>/$MYSQL_NAME/" /var/www/app/inc/constants.php
sed -i -e"s/<database user>/$MYSQL_USER/" /var/www/app/inc/constants.php
sed -i -e"s/<database password>/$MYSQL_PASSWORD/" /var/www/app/inc/constants.php
sed -i -e"s/<database server>/$MYSQL_PORT_3306_TCP_ADDR:$MYSQL_PORT_3306_TCP_PORT/" /var/www/app/inc/constants.php
sed -i -e"s/<relative path to the logo file>/ /" /var/www/app/inc/constants.php
sed -i -e"s/<relative path to the logo file for pdf>/ /" /var/www/app/inc/constants.php

php -r "readfile('https://getcomposer.org/installer');" | php
./composer.phar install --no-interaction

exec /usr/sbin/apache2ctl -D FOREGROUND