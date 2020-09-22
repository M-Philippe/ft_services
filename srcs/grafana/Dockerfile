FROM alpine:latest

EXPOSE 3000

RUN apk add nano
RUN apk add grafana --repository http://dl-3.alpinelinux.org/alpine/edge/testing/
RUN mkdir -p /var/lib/grafana/dashboards
COPY ./srcs/entrypoint.sh .
COPY ./srcs/grafana.ini .
COPY ./srcs/dashboards/*.json /var/lib/grafana/dashboards/
COPY ./srcs/dashboard_provider.yaml ./usr/share/grafana/conf/provisioning/dashboards
COPY ./srcs/influxdb_datasource.yaml ./usr/share/grafana/conf/provisioning/datasources

ENTRYPOINT ["/bin/sh", "entrypoint.sh"]