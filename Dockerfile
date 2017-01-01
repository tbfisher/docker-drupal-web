FROM httpd:2.4.25

MAINTAINER Brian Fisher <tbfisher@gmail.com>

RUN cp /usr/local/apache2/conf/httpd.conf /usr/local/apache2/conf/httpd.conf-default
COPY conf/httpd.conf /usr/local/apache2/conf/httpd.conf
COPY conf/conf-enabled/default.conf /usr/local/apache2/conf/conf-enabled/default.conf

# Configurable virtualhost.
ENV WEB_DOCROOT="/var/www/html"
# ENV WEB_DRUPAL_PRIVATE_FILES="^/sites/.*/private/"
# COPY conf/docker-entrypoint.sh /usr/local/bin/
# ENTRYPOINT ["docker-entrypoint.sh"]

RUN mkdir -p ${WEB_DOCROOT} && \
    echo '<?php phpinfo();' > ${WEB_DOCROOT}/index.php

# Configure directories for drupal.
RUN mkdir /var/www_files && \
    mkdir -p /var/www_files/public && \
    mkdir -p /var/www_files/private && \
    chown -R www-data:www-data /var/www_files && \
    chmod 775 /var/www_files
VOLUME /var/www_files
