FROM archlinux

WORKDIR /srv/http/aurweb/

RUN pacman -Sy --noconfirm nginx php php-fpm python-mysql-connector \
      python-pygit2 python-srcinfo python-sqlalchemy \
      python-bleach python-markdown php-memcached
RUN sed -i 's/;\(.*pdo_mysql\)/\1/' /etc/php/php.ini
RUN sed -i '/extension=mysqli/a extension=memcached' /etc/php/php.ini

COPY . /srv/http/aurweb/
COPY nginx.conf /etc/nginx/nginx.conf
RUN python3 setup.py install
RUN useradd -U -d /srv/http/aurweb -c 'AUR user' aur

COPY conf/config.defaults /etc/aurweb/config

RUN chown -R http: /srv/http/
CMD ["/srv/http/aurweb/docker-entrypoint.sh"]
