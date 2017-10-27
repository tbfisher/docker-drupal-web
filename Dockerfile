FROM nginx:1.12.2

MAINTAINER Brian Fisher <tbfisher@gmail.com>

COPY conf/nginx.conf-development /etc/nginx/nginx.conf
COPY conf/drupal.conf-development /etc/nginx/conf.d/default.conf

# Configurable virtualhost.
ENV WEB_DOCROOT="/var/www/html"
ENV WEB_PHPFPM="php:9000"
ENV WEB_DRUPAL_PRIVATE_FILES="^/sites/.*/private/"
COPY conf/docker-entrypoint.sh /usr/local/bin/
ENTRYPOINT ["docker-entrypoint.sh"]

RUN mkdir -p ${WEB_DOCROOT} && \
    echo '<?php phpinfo();' > ${WEB_DOCROOT}/index.php

# Configure directories for drupal.
RUN mkdir -p /var/www_files/public && \
    mkdir -p /var/www_files/private && \
    chown www-data:www-data /var/www_files/* && \
    chmod 775 /var/www_files/*

# Remove 443
EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
