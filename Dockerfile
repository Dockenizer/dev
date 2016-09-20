FROM dockenizer/php-fpm
MAINTAINER Jacques Moati <jacques@moati.net>

RUN apk --update \
        add mysql-client nano htop supervisor sudo nodejs git openssh-client && \

    mkdir /etc/supervisor.d/ && \
    echo "www-data ALL=(ALL:ALL) NOPASSWD: ALL" | (EDITOR="tee -a" visudo) && \

    rm -rf /var/cache/apk/*

RUN wget http://get.sensiolabs.org/php-cs-fixer.phar -O /usr/local/bin/php-cs-fixer && \
    chmod +x /usr/local/bin/php-cs-fixer

RUN cd /tmp && \
    php -r "readfile('https://getcomposer.org/installer');" | php && \
    mv composer.phar /usr/local/bin/composer

ADD squire /usr/local/bin/squire

ADD run.sh /run.sh
RUN chmod +x /run.sh

VOLUME /var/www
VOLUME /etc/supervisor.d

WORKDIR /var/www

CMD /run.sh
