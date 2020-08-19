#chmod 644 /etc/ssl/certs/nginx.crt
#chmod 600 /etc/ssl/private/nginx.key

#mkdir /etc/nginx/ssl
#openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt

#echo "Port 30022" >> /etc/ssh/sshd_config

#ssh-keygen -A
#adduser --disabled-password "admin"
#echo "admin:admin" | chpasswd

nginx -g 'daemon off;'