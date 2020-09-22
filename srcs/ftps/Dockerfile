FROM alpine:latest

EXPOSE 20 21

RUN apk add vsftpd openssl

RUN adduser -D user
RUN echo "user:user" | chpasswd
RUN echo "user" >> /etc/vsftpd/vsftpd.userlist

COPY ./srcs/vsftpd.conf /etc/vsftpd/vsftpd.conf
COPY ./srcs/entrypoint.sh usr/local/bin/entrypoint.sh

RUN chmod +x /usr/local/bin/entrypoint.sh
RUN mkdir -p /home/vsftpd
RUN chown -R ftp:ftp /home/vsftpd

VOLUME /home/user
VOLUME /var/log/vsftpd

ENTRYPOINT ["/bin/sh", "usr/local/bin/entrypoint.sh"]
