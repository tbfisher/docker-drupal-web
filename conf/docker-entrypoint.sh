#!/bin/sh
set -e

sed -i 's@%NGINX_DOCROOT%@'"${NGINX_DOCROOT}"'@' /etc/nginx/conf.d/*.conf
echo "Configured NGINX docroot to ${NGINX_DOCROOT}."

sed -i 's@%NGINX_DRUPAL_PRIVATE_FILES%@'"${NGINX_DRUPAL_PRIVATE_FILES}"'@' /etc/nginx/conf.d/*.conf
echo "Configured Drupal private files to ${NGINX_DRUPAL_PRIVATE_FILES}."

exec "$@"
