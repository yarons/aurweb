FROM archlinux

WORKDIR /srv/http

RUN pacman -Sy --noconfirm nginx php php-fpm python-mysql-connector \
      python-pygit2 python-srcinfo python-sqlalchemy \
      python-bleach python-markdown php-memcached
RUN sed -i 's/;\(.*pdo_mysql\)/\1/' /etc/php/php.ini
RUN sed -i '/extension=mysqli/a extension=memcached' /etc/php/php.ini

COPY . /srv/http
COPY nginx.conf /etc/nginx/nginx.conf
RUN python3 setup.py install
RUN useradd -U -d /srv/http/aurweb -c 'AUR user' aur

COPY conf/config.defaults /etc/aurweb/

RUN chown -R http: /srv/http/
CMD ["/bin/bash"]
#RUN python -m aurweb.initdb
#RUN docker-php-ext-install pdo_mysql
