#!/bin/bash

path=$1

if [ "$2" = "--install-wp" ];
then
	wp core download --path=$path --locale=ru_RU && \
	sudo chown -R www-data:www-data ./$path && \
	sudo usermod -aG www-data $USER && \
	sudo chmod -R 775 ./$path
fi

if [ "$3" = "--install-plugins" ];
then
	wp plugin install --path=$path cyr2lat fast-velocity-minify kama-spamblock tiny-compress-images wp-mail-smtp wordpress-seo svg-support --activate && wp plugin uninstall hello-dolly akismet
fi

exit 0