FROM alpine:3.12.0

MAINTAINER edouvier

RUN apk update && apk upgrade
COPY srcs/ip /tmp/

RUN apk add influxdb
COPY srcs/influxdb.conf /etc/

VOLUME ["/var/lib/influxdb"]
EXPOSE 8086

RUN rm -rf /var/cache/apk/*
COPY srcs/entrypoint.sh /tmp/
ENTRYPOINT ["sh", "/tmp/entrypoint.sh"]
