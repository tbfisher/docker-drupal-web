#!/bin/sh
set -e

sed -i 's@%WEB_DOCROOT%@'"${WEB_DOCROOT}"'@' /usr/local/apache2/conf/conf-enabled/*.conf

exec "$@"
