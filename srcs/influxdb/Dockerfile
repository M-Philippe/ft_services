FROM alpine:latest

EXPOSE 8086

RUN apk add nano wget
RUN wget https://dl.influxdata.com/influxdb/releases/influxdb-1.8.1-static_linux_amd64.tar.gz
RUN tar xvfz influxdb-1.8.1-static_linux_amd64.tar.gz
COPY ./srcs/influxdb.conf ./influxdb-1.8.1-1/influxdb.conf
COPY ./srcs/entrypoint.sh .
COPY ./srcs/loading_database.sh .

ENTRYPOINT ["/bin/sh", "entrypoint.sh"]