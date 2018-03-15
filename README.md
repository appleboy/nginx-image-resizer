# nginx-image-resizer

<img src="./images/26946324088_5b3f0b1464_o.png">

Docker Container of real time image resizing and caching

## Build Image

```
$ docker build -t appleboy/nginx-image-resizer .
```

## RUN Image

```
$ docker run -e NGINX_PORT=8081 \
  -e NGINX_HOST=localhost \
  -e IMAGE_HOST2="http://localhost:9000" \
  appleboy/nginx-image-resizer
```

## Paramemter

| Parameter   | required | default value |
|-------------|--------|----|
| NGINX_HOST  | true   |    |
| IMAGE_HOST  | true   |    |
| JPG_QUALITY | false  | 95 |
| EXPIRE_TIME | false  | 7d |

## example

Start [minio](https://minio.io/) and nginx-image-resizer using docker-compose.yml

```sh
$ docker-compose up
```

Default access key and secret key as following. create new bucket and uploade test image.

```
MINIO_ACCESS_KEY: YOUR_MINIO_ACCESS_KEY
MINIO_SECRET_KEY: YOUR_MINIO_SECRET_KEY
```

open browser as following

```
# format: http://localhost:8002/resize_image_width/bucket_name/image_name
http://localhost:8002/300/test/test.png
```
