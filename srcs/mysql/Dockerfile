FROM alpine:latest

EXPOSE 3306

RUN apk add mysql mysql-client nano
RUN mkdir -p /run/mysqld
RUN mkdir -p ./database
RUN mysql_install_db --user=root --datadir=./data

COPY ./srcs/mysql_init .
COPY ./srcs/mariadb-server.cnf ./etc/my.cnf.d/
COPY ./srcs/entrypoint.sh .
COPY ./srcs/loading_database.sh .
COPY ./srcs/liveness.sh .

ENTRYPOINT ["/bin/sh", "entrypoint.sh"]
