FROM alpine:latest

EXPOSE 80 443 22

RUN apk add nginx openssh;\
	mkdir /run/nginx;

COPY ./srcs/default.conf /etc/nginx/conf.d/default.conf
COPY ./srcs/nginx-selfsigned.key /etc/ssl/private/
COPY ./srcs/nginx-selfsigned.crt /etc/ssl/certs
COPY ./srcs/index.html /var/www/localhost/htdocs/
COPY ./srcs/entrypoint.sh /usr/local/bin/entrypoint.sh
COPY ./srcs/liveness.sh ./liveness.sh

ENTRYPOINT ["/bin/sh", "usr/local/bin/entrypoint.sh"]
