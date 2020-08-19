FROM alpine:3.12.0

MAINTAINER edouvier

RUN apk update && apk upgrade
COPY srcs/ip /tmp/

RUN apk add pure-ftpd --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing/
RUN apk add openssl
COPY srcs/pure-ftpd.pem /etc/ssl/private/

EXPOSE 21 30020

RUN rm -rf /var/cache/apk/*
COPY srcs/entrypoint.sh /tmp/
ENTRYPOINT ["sh", "/tmp/entrypoint.sh"]