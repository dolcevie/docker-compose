FROM php:8.1-fpm-alpine3.18

ENV PHPGROUP=laravel
ENV PHPUSER=laravel

RUN adduser -g ${PHPGROUP} -s /bin/sh -D ${PHPUSER}

RUN sed -i "s/user = www-data/user = ${PHPUSER}/g" /usr/local/etc/php-fpm.d/www.conf
RUN sed -i "s/group = www-data/group = ${PHPGROUP}/g" /usr/local/etc/php-fpm.d/www.conf

#for tunel ssh
RUN mkdir -p /home/.ssh
ADD ../extras/ssh/*.pem /home/.ssh

RUN chown -R ${PHPUSER}:${PHPUSER} /home/.ssh
RUN chown -R ${PHPUSER}:${PHPUSER} /usr/local/etc

# Set working directory
WORKDIR /var/www/html/$APP_NAME

# Libs
RUN apk add --no-cache tzdata libzip-dev libpng-dev libsodium libsodium-dev openssh-client

#set timezone
ENV TZ=America/Mexico_City

# Install extensions
RUN docker-php-ext-install pdo pdo_mysql opcache zip bz2 sodium gd

ADD ./opcache/opcache.ini /usr/local/etc/php/conf.d/opcache.ini

CMD ["php-fpm", "-y", "/usr/local/etc/php-fpm.conf", "-R"]
