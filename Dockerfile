FROM nginx:1.13-alpine

COPY default.conf /etc/nginx/conf.d/default.conf
COPY run.sh /bin/

CMD ["/bin/run.sh"]
