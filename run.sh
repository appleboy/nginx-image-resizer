#!/bin/sh

DEFAULT_EXPIRE_TIME="7d"
DEFAULT_JPG_QUALITY="95"
DEFAULT_MEMORY_SIZE="20m"
DEFAULT_CACHE_NAME="cache_zone"
DEFAULT_CACHE_SIZE="40m"
DEFAULT_INACTIVE_TIME="30d"

[ -z "$NGINX_HOST" ] && echo "missing NGINX_HOST variable" && exit 1
[ -z "$IMAGE_HOST" ] && echo "missing IMAGE_HOST variable" && exit 1
[ -n "$EXPIRE_TIME" ] && DEFAULT_EXPIRE_TIME=$EXPIRE_TIME
[ -n "$JPG_QUALITY" ] && DEFAULT_JPG_QUALITY=$JPG_QUALITY
[ -n "$MEMORY_SIZE" ] && DEFAULT_MEMORY_SIZE=$MEMORY_SIZE
[ -n "$CACHE_NAME" ] && DEFAULT_CACHE_NAME=$CACHE_NAME
[ -n "$CACHE_SIZE" ] && DEFAULT_CACHE_SIZE=$CACHE_SIZE
[ -n "$INACTIVE_TIME" ] && DEFAULT_INACTIVE_TIME=$INACTIVE_TIME

IMAGE_HOST=${IMAGE_HOST//\//\\/}
sed -i -e "s/\${NGINX_HOST}/$NGINX_HOST/" /etc/nginx/conf.d/default.conf
sed -i -e "s/\${IMAGE_HOST}/$IMAGE_HOST/" /etc/nginx/conf.d/default.conf
sed -i -e "s/\${EXPIRE_TIME}/$DEFAULT_EXPIRE_TIME/" /etc/nginx/conf.d/default.conf
sed -i -e "s/\${JPG_QUALITY}/$DEFAULT_JPG_QUALITY/" /etc/nginx/conf.d/default.conf
sed -i -e "s/\${MEMORY_SIZE}/$DEFAULT_MEMORY_SIZE/" /etc/nginx/conf.d/default.conf
sed -i -e "s/\${CACHE_NAME}/$DEFAULT_CACHE_NAME/" /etc/nginx/conf.d/default.conf
sed -i -e "s/\${CACHE_SIZE}/$DEFAULT_CACHE_SIZE/" /etc/nginx/conf.d/default.conf
sed -i -e "s/\${INACTIVE_TIME}/$DEFAULT_INACTIVE_TIME/" /etc/nginx/conf.d/default.conf

nginx -g "daemon off;"
