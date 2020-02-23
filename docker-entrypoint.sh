#!/bin/bash
sed -i 's/\(enable-maintenance = \)1/\10/' /etc/aurweb/config
sed -i 's/\(host = \)localhost/\1db/' /etc/aurweb/config
php-fpm &
nginx -g 'daemon off;'
