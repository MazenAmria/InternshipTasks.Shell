yum install -y httpd
systemctl start httpd
systemctl enable httpd

systemctl start crond
systemctl enable crond

mkdir stats

crontab -l > temp_file
echo "* 1 * * * ./collecting_stats.sh" >> temp_file
echo "* 1 * * * ./calc_avgs.sh" >> temp_file
crontab temp_file
