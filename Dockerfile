FROM nginx:1.10.2

MAINTAINER Brian Fisher <tbfisher@gmail.com>

COPY conf/nginx.conf /etc/nginx/nginx.conf
COPY conf/drupal.conf /etc/nginx/conf.d/default.conf

# Configurable virtualhost.
ENV NGINX_DOCROOT="/var/www/html"
ENV NGINX_DRUPAL_PRIVATE_FILES="^/sites/.*/private/"
COPY conf/docker-entrypoint.sh /usr/local/bin/
ENTRYPOINT ["docker-entrypoint.sh"]

RUN mkdir -p ${NGINX_DOCROOT} && \
    echo '<?php phpinfo();' > ${NGINX_DOCROOT}/index.php

# Configure directories for drupal.
RUN mkdir /var/www_files && \
    mkdir -p /var/www_files/public && \
    mkdir -p /var/www_files/private && \
    chown -R www-data:www-data /var/www_files && \
    chmod 775 /var/www_files
VOLUME /var/www_files

# Remove 443
EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
