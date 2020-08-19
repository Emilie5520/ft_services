FROM alpine:3.12.0

MAINTAINER edouvier

RUN apk update && apk upgrade
COPY srcs/ip /tmp/

RUN apk add mysql mysql-client
COPY srcs/my.cnf /etc/mysql/
COPY srcs/mysql-init /tmp/

VOLUME ["/var/lib/mysql"]
EXPOSE 3306

RUN rm -rf /var/cache/apk/*
RUN mkdir -p /run/mysqld
COPY srcs/entrypoint.sh /tmp/
ENTRYPOINT ["sh", "/tmp/entrypoint.sh"]
