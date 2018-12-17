#!/bin/sh
set -e

sed -i 's@%WEB_DOCROOT%@'"${WEB_DOCROOT}"'@' /etc/nginx/conf.d/*.conf
echo "Configured NGINX docroot to ${WEB_DOCROOT}."

sed -i 's@%WEB_PHPFPM%@'"${WEB_PHPFPM}"'@' /etc/nginx/conf.d/*.conf
echo "Configured PHP FPM to ${WEB_PHPFPM}."
sed -i 's@%WEB_FASTCGI_BUFFERS%@'"${WEB_FASTCGI_BUFFERS}"'@' /etc/nginx/conf.d/*.conf
echo "Configured PHP FPM to ${WEB_FASTCGI_BUFFERS}."
sed -i 's@%WEB_FASTCGI_BUFFER_SIZE%@'"${WEB_FASTCGI_BUFFER_SIZE}"'@' /etc/nginx/conf.d/*.conf
echo "Configured PHP FPM to ${WEB_FASTCGI_BUFFER_SIZE}."

sed -i 's@%WEB_DRUPAL_PRIVATE_FILES%@'"${WEB_DRUPAL_PRIVATE_FILES}"'@' /etc/nginx/conf.d/*.conf
echo "Configured Drupal private files to ${WEB_DRUPAL_PRIVATE_FILES}."

exec "$@"
