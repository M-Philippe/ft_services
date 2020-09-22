adduser -D ssh_user
echo "ssh_user:ssh_user" | chpasswd
ssh-keygen -f /etc/ssh/ssh_host_rsa_key -N '' -t rsa
ssh-keygen -f /etc/ssh/ssh_host_dsa_key -N '' -t dsa
mkdir -p /var/run/sshd
/usr/sbin/sshd
nginx -g 'daemon off;'

while [ true ]
do true = true
done
