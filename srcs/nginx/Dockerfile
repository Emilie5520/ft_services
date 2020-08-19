FROM alpine:3.12.0

MAINTAINER edouvier

RUN apk update && apk upgrade
COPY srcs/ip /tmp/

RUN apk add nginx
COPY srcs/default.conf /etc/nginx/conf.d/

#COPY srcs/nginx.crt /etc/ssl/certs/
#COPY srcs/nginx.key /etc/ssl/private/

RUN apk add openssh
RUN apk add openssl

RUN adduser -D user
RUN echo "user:password"|chpasswd
RUN ssh-keygen -A
RUN yes "" | openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/certs/localhost.key -out /etc/ssl/certs/localhost.crt

EXPOSE 80 
EXPOSE 443 
EXPOSE 30022

RUN rm -rf /var/cache/apk/*
RUN mkdir -p /run/nginx
COPY srcs/entrypoint.sh /tmp/
ENTRYPOINT ["sh", "/tmp/entrypoint.sh"]
