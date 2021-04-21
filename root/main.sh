#!/bin/bash

# install apache server and start it
yum install -y httpd
systemctl start httpd

# start cron service
systemctl start crond

# install sysstat needed for cpu stats
yum install -y sysstat

# create a directory for the collected stats
stats=~/stats/
if [ ! -d "$stats" ]; then
	mkdir $stats
fi

# create directories for the html files
cpu=/var/www/html/cpu
if [ ! -d "$cpu" ]; then
	mkdir $cpu
fi

memory=/var/www/html/memory
if [ ! -d "$memory" ]; then
	mkdir $memory
fi

disk=/var/www/html/disk
if [ ! -d "$disk" ]; then
	mkdir $disk
fi

# temp file to deal with the crontab
temp_file=~/temp.$(date "+%Y.%m.%d-%H.%M.%S")

# dump the crontab to the temp file
crontab -l > $temp_file

# add the cronjobs to the temp file

# job 1: collect the stats
chmod +x ~/collecting_stats.sh
sed -i "/^.*~\/collecting_stats.sh$/d" $temp_file
echo "0 * * * * ~/collecting_stats.sh" >> $temp_file

# job 2: calculate the averages and modify the html
chmod +x ~/calc_avgs.sh
chmod +x ~/calc_avgs.awk
sed -i "/^.*~\/calc_avgs.sh$/d" $temp_file
echo "0 * * * * ~/calc_avgs.sh" >> $temp_file

# reload the crontab with the edited temp file
crontab $temp_file

# remove the tempfile
rm -f $temp_file

echo "Setup Complete..."
