#!/bin/sh

DEFAULT_EXPIRE_TIME="7d"
DEFAULT_JPG_QUALITY="95"
DEFAULT_MEMORY_SIZE="20m"

[ -z "$NGINX_HOST" ] && echo "missing NGINX_HOST variable" && exit 1
[ -z "$IMAGE_HOST" ] && echo "missing IMAGE_HOST variable" && exit 1
[ -n "$EXPIRE_TIME" ] && DEFAULT_EXPIRE_TIME=$EXPIRE_TIME
[ -n "$JPG_QUALITY" ] && DEFAULT_JPG_QUALITY=$JPG_QUALITY
[ -n "$MEMORY_SIZE" ] && DEFAULT_MEMORY_SZIE=$MEMORY_SIZE

IMAGE_HOST=${IMAGE_HOST//\//\\/}
sed -i -e "s/\${NGINX_HOST}/$NGINX_HOST/" /etc/nginx/conf.d/default.conf
sed -i -e "s/\${IMAGE_HOST}/$IMAGE_HOST/" /etc/nginx/conf.d/default.conf
sed -i -e "s/\${EXPIRE_TIME}/$DEFAULT_EXPIRE_TIME/" /etc/nginx/conf.d/default.conf
sed -i -e "s/\${JPG_QUALITY}/$DEFAULT_JPG_QUALITY/" /etc/nginx/conf.d/default.conf
sed -i -e "s/\${MEMORY_SIZE}/$DEFAULT_MEMORY_SZIE/" /etc/nginx/conf.d/default.conf

nginx -g "daemon off;"
