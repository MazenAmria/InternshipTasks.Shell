#!/bin/bash

# install apache server and start it
yum install -y httpd
systemctl start httpd

# start cron service
systemctl start crond

# install sysstat needed for cpu stats
yum install -y sysstat

# create a directory for the collected stats
mkdir ~/stats/

# temp file to deal with the crontab
temp_file=~/temp.$(date "+%Y.%m.%d-%H.%M.%S")

# dump the crontab to the temp file
crontab -l > $temp_file

# add the cronjobs to the temp file
# job 1: collect the stats
echo "* 1 * * * ~/collecting_stats.sh" >> $temp_file
# job 2: calculate the averages and modify the html
echo "* 1 * * * ~/calc_avgs.sh" >> $temp_file

# reload the crontab with the edited temp file
crontab $temp_file

# remove the tempfile
rm -f $temp_file
