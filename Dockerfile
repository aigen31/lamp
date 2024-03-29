FROM php:8.2-apache

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

# RUN apt update && \
# apt install -y nodejs npm

RUN curl -sS https://getcomposer.org/installer -o composer-setup.php && \
php composer-setup.php --install-dir=/usr/local/bin --filename=composer

# Use the default production configuration
# RUN mv "$PHP_INI_DIR/php.ini-development" "$PHP_INI_DIR/php.ini"

COPY /php/conf.d/example.com.ini /usr/local/etc/php/conf.d
# COPY /php/php.ini-development /usr/local/etc/php/php.ini
COPY /php/php.ini-production /usr/local/etc/php/php.ini

RUN a2enmod ssl
RUN a2enmod rewrite

# COPY ./letsencrypt/conf /etc/letsencrypt/conf
COPY ./apache/example.com.conf /etc/apache2/sites-available/example.com.conf

RUN a2dissite 000-default.conf
RUN a2ensite example.com.conf

WORKDIR /var/www/example.com
