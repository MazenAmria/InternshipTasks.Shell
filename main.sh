yum install -y httpd
systemctl start httpd
systemctl enable httpd

systemctl start crond
systemctl enable crond

