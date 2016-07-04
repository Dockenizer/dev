FROM dockenizer/php-fpm
MAINTAINER Jacques Moati <jacques@moati.net>

RUN apk --update \
        add mysql-client nano htop supervisor sudo nodejs && \

    echo "www-data ALL=(ALL:ALL) NOPASSWD: ALL" | (EDITOR="tee -a" visudo) && \

    rm -rf /var/cache/apk/*

ADD run.sh /run.sh
RUN chmod +x /run.sh

VOLUME /var/www
WORKDIR /var/www

CMD /run.sh
