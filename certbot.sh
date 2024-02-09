#!/bin/bash

docker run -it --rm --name certbot -v "./letsencrypt/etc:/etc/letsencrypt" -v "./letsencrypt/var:/var/lib/letsencrypt" -p 80:80 certbot/certbot certonly --dry-run