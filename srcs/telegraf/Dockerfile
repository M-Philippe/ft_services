FROM alpine:latest

EXPOSE 3050

RUN apk add nano wget
RUN wget https://dl.influxdata.com/telegraf/releases/telegraf-1.14.0-static_linux_amd64.tar.gz
RUN tar -C . -xzf telegraf-1.14.0-static_linux_amd64.tar.gz
RUN chmod +x telegraf/telegraf
RUN cp telegraf/telegraf /usr/bin/
RUN rm -rf telegraf-1.14.0-static_linux_amd64.tar.gz telegraf
RUN mkdir /etc/telegraf

COPY ./srcs/telegraf.conf /etc/telegraf/telegraf.conf
COPY ./srcs/entrypoint.sh .
COPY ./srcs/liveness.sh .

ENTRYPOINT ["/usr/bin/telegraf"]