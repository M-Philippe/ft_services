mkdir -p /etc/vsftpd/private
openssl req -x509 -nodes -days 7300 -newkey rsa:2048 -keyout /etc/vsftpd/private/vsftpd.pem -out /etc/vsftpd/private/vsftpd.pem -subj "/C=FR/O=42/CN=LYON"
openssl pkcs12 -export -out /etc/vsftpd/private/vsftpd.pkcs12 -in /etc/vsftpd/private/vsftpd.pem -passout pass:

chmod 755 /etc/vsftpd/private/vsftpd.pem
chmod 755 /etc/vsftpd/private/vsftpd.pkcs12

chmod a-w /home/user
mkdir /home/user/data
chown user /home/user/data

/usr/sbin/vsftpd /etc/vsftpd/vsftpd.conf
