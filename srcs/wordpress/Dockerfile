FROM alpine:3.12.0

MAINTAINER edouvier
RUN apk update && apk upgrade
COPY srcs/ip /tmp/

RUN apk add php7 php7-fpm php7-opcache php7-gd php7-mysqli \
	php7-zlib php7-curl php7-mbstring php7-json php7-session

RUN wget https://wordpress.org/latest.tar.gz
RUN tar -xvf latest.tar.gz
RUN rm -f latest.tar.gz
RUN mv wordpress /etc/
COPY srcs/wp-config.php /etc/wordpress/

RUN apk add mysql-client
COPY srcs/launch-wordpress.sh /tmp/

EXPOSE 5050

RUN rm -rf /var/cache/apk/*
COPY srcs/entrypoint.sh /tmp/
ENTRYPOINT ["sh", "/tmp/entrypoint.sh"]
