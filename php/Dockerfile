FROM php:apache

ADD https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/

RUN chmod +x /usr/local/bin/install-php-extensions && \
install-php-extensions gmp \
curl \
intl \
mbstring \
xmlrpc \
gd \
xml \
zip \
mysqli

RUN a2enmod rewrite

WORKDIR /var/www/html
