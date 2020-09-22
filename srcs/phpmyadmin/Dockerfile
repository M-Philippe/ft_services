FROM alpine:latest

EXPOSE 5000

RUN apk add lighttpd
RUN mkdir /etc/lighttpd/certs
RUN apk add lighttpd php7-common php7-iconv php7-json php7-gd php7-curl php7-xml php7-mysqli php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql php7-soap php7-xmlrpc php7-posix php7-mcrypt php7-gettext php7-ldap php7-ctype php7-dom
RUN apk add wget php-zlib
RUN apk add php7 php7-bcmath php7-bz2 php7-ctype php7-curl php7-dom php7-enchant php7-exif php7-fpm \
php7-gd php7-gettext php7-gmp php7-iconv php7-imap php7-intl php7-json php7-mbstring php7-opcache php7-openssl \
php7-phar php7-posix php7-pspell php7-recode php7-session php7-simplexml php7-sockets php7-sysvmsg php7-sysvsem \
php7-sysvshm php7-tidy php7-xml php7-xmlreader php7-xmlrpc php7-xmlwriter php7-xsl php7-zip \
php7-sqlite3
RUN cd /var/www/localhost/htdocs ; wget http://files.directadmin.com/services/all/phpMyAdmin/phpMyAdmin-5.0.2-all-languages.tar.gz ; tar -xzvf phpMyAdmin-5.0.2-all-languages.tar.gz; rm phpMyAdmin-5.0.2-all-languages.tar.gz ; mv phpMyAdmin-5.0.2-all-languages phpmyadmin
RUN mkdir /var/run/lighttpd
RUN touch /var/run/lighttpdphp-fastcgi.socket
RUN chown -R lighttpd:lighttpd /var/run/lighttpd

COPY ./srcs/entrypoint.sh .
COPY ./srcs/lighttpd.conf /etc/lighttpd/
COPY ./srcs/mod_fastcgi.conf /etc/lighttpd/
COPY ./srcs/index.html /var/www/localhost/htdocs
COPY ./srcs/phpmyadmin.pem /etc/lighttpd/certs/
COPY ./srcs/config.inc.php /var/www/localhost/htdocs/phpmyadmin

ENTRYPOINT ["/bin/sh", "entrypoint.sh"]