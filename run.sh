#!/bin/sh

DEFAULT_EXPIRE_TIME="7d"
DEFAULT_JPG_QUALITY="95"

[ -z "$NGINX_HOST" ] && echo "missing NGINX_HOST variable" && exit 1
[ -z "$IMAGE_HOST" ] && echo "missing IMAGE_HOST variable" && exit 1
[ -n "$EXPIRE_TIME" ] && DEFAULT_EXPIRE_TIME=$EXPIRE_TIME
[ -n "$JPG_QUALITY" ] && DEFAULT_JPG_QUALITY=$JPG_QUALITY

IMAGE_HOST=${IMAGE_HOST//\//\\/}
sed -i -e "s/\${NGINX_HOST}/$NGINX_HOST/" /etc/nginx/conf.d/default.conf
sed -i -e "s/\${IMAGE_HOST}/$IMAGE_HOST/" /etc/nginx/conf.d/default.conf
sed -i -e "s/\${EXPIRE_TIME}/$DEFAULT_EXPIRE_TIME/" /etc/nginx/conf.d/default.conf
sed -i -e "s/\${JPG_QUALITY}/$DEFAULT_JPG_QUALITY/" /etc/nginx/conf.d/default.conf

nginx -g "daemon off;"
