FROM nginx:1.10.3

MAINTAINER Brian Fisher <tbfisher@gmail.com>

COPY conf/nginx.conf /etc/nginx/nginx.conf
COPY conf/drupal.conf /etc/nginx/conf.d/default.conf
COPY conf/proxy.conf /etc/nginx/conf.d/proxy.conf

# Configurable virtualhost.
ENV WEB_DOCROOT="/var/www/html"
ENV WEB_PHPFPM="php:9000"
ENV WEB_FASTCGI_BUFFERING="on"
ENV WEB_FASTCGI_BUFFERS="16 32k"
ENV WEB_FASTCGI_BUFFER_SIZE="32k"
ENV WEB_PROXY_BUFFERS="4 256k"
ENV WEB_PROXY_BUFFER_SIZE="128k"
ENV WEB_PROXY_BUSY_BUFFERS_SIZE="256k"
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
