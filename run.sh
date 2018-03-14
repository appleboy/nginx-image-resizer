#!/bin/sh

IMAGE_HOST=${IMAGE_HOST//\//\\/}
sed -i -e "s/\${NGINX_PORT}/$NGINX_PORT/" /etc/nginx/conf.d/default.conf
sed -i -e "s/\${NGINX_HOST}/$NGINX_HOST/" /etc/nginx/conf.d/default.conf
sed -i -e "s/\${IMAGE_HOST}/$IMAGE_HOST/" /etc/nginx/conf.d/default.conf

[ -z "$NGINX_PORT" ] && echo "missing NGINX_PORT variable" && exit 1
[ -z "$NGINX_HOST" ] && echo "missing NGINX_HOST variable" && exit 1
[ -z "$IMAGE_HOST" ] && echo "missing IMAGE_HOST variable" && exit 1

nginx -g "daemon off;"
