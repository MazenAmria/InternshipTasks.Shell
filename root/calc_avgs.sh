#!/bin/bash

# define CPU stat page
cpu=/var/www/html/cpu/index.html

# fill the header part
cat header.html > $cpu

if [ $(ls ~/stats/cpu.* | wc -w) -lt 24 ]; then
	echo "No enough stats." >> $cpu
elif
	# get the last 24 records and calculates the average
	~/calc_avgs.awk $(ls -lt ~/stats/cpu.* | tail -n +2 | head -n 24 | awk '{print $9}') >> $cpu
fi

# fill the footer part
cat footer.html >> $cpu

# define Memory stat page
mem=/var/www/html/memory/index.html

# fill the header part
cat header.html > $mem

if [ $(ls ~/stats/mem.* | wc -w) -lt 24 ]; then
	echo "No enough stats." >> $mem
elif
	# get the last 24 records and calculates the average
	~/calc_avgs.awk $(ls -lt ~/stats/mem.* | tail -n +2 | head -n 24 | awk '{print $9}') >> $mem
fi

# fill the footer part
cat footer.html >> $mem

# define Disk stat page
disk=/var/www/html/disk/index.html

# fill the header part
cat header.html > $disk

if [ $(ls ~/stats/disk.* | wc -w) -lt 24 ]; then
	echo "No enough stats." >> $disk
elif
	# get the last 24 records and calculates the average
	~/calc_avgs.awk $(ls -lt ~/stats/disk.* | tail -n +2 | head -n 24 | awk '{print $9}') >> $disk
fi

# fill the footer part
cat footer.html >> $disk
