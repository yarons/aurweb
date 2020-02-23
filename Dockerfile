FROM archlinux

WORKDIR /srv/http/aurweb/

RUN pacman -Sy --noconfirm git nginx php php-fpm python-mysql-connector \
      python-pygit2 python-srcinfo python-sqlalchemy \
      python-bleach python-markdown php-memcached
RUN sed -i 's/;\(.*pdo_mysql\)/\1/' /etc/php/php.ini
RUN sed -i '/extension=mysqli/a extension=memcached' /etc/php/php.ini

COPY . /srv/http/aurweb/
COPY nginx.conf /etc/nginx/nginx.conf
RUN python3 setup.py install
RUN useradd -U -d /srv/http/aurweb -c 'AUR user' aur

COPY conf/config.defaults /etc/aurweb/config

RUN mkdir /srv/http/aurweb/aur.git/ \
    && cd /srv/http/aurweb/aur.git/ \
    && git init --bare \
    && git config --local transfer.hideRefs '^refs/' \
    && git config --local --add transfer.hideRefs '!refs/' \
    && git config --local --add transfer.hideRefs '!HEAD' \
    && ln -s /usr/local/bin/aurweb-git-update hooks/update \
    && chown -R aur /srv/http/aurweb/aur.git/

RUN cat ssh_config >> /etc/sshd_config
RUN chown -R http: /srv/http/
CMD ["/srv/http/aurweb/docker-entrypoint.sh"]
