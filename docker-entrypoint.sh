#!/bin/bash
sed -i 's/\(enable-maintenance = \)1/\10/' /etc/aurweb/config
sed -i 's/\(host = \)localhost/\1db/' /etc/aurweb/config
sed -i 's/\(memcache_servers = \)127.0.0.1\(:11211\)/\1memcache\2/' /etc/aurweb/config
php-fpm &
nginx
