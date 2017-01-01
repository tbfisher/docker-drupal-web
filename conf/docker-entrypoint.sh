#!/bin/sh
set -e

sed -i 's@%WEB_DOCROOT%@'"${WEB_DOCROOT}"'@' /etc/nginx/conf.d/*.conf
echo "Configured NGINX docroot to ${WEB_DOCROOT}."

sed -i 's@%WEB_DRUPAL_PRIVATE_FILES%@'"${WEB_DRUPAL_PRIVATE_FILES}"'@' /etc/nginx/conf.d/*.conf
echo "Configured Drupal private files to ${WEB_DRUPAL_PRIVATE_FILES}."

exec "$@"
