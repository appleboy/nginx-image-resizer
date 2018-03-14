# nginx-image-resizer

Docker Container of real time image resizing and caching

## Build Image

```
$ docker build -t appleboy/nginx-resizer .
```

## RUN Image

```
$ docker run -e NGINX_PORT=8081 \
  -e NGINX_HOST=localhost \
  -e IMAGE_HOST2="http://localhost:9000" \
  appleboy/nginx-resizer
```
