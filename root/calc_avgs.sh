#!/bin/bash

# define CPU stat page
cpu=/var/www/html/cpu/index.html

# fill the header part
cat header.html > $cpu

if [ $(ls ~/stats/cpu.* | wc -w) -lt 24 ]; then
	echo "No enough stats." >> $cpu
elif
	# get the last 24 records and calculates the average
	~/calc_avgs.awk $(ls -t ~/stats/cpu.* | head -n 24) >> $cpu
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
	~/calc_avgs.awk $(ls -t ~/stats/mem.* | head -n 24) >> $mem
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
	~/calc_avgs.awk $(ls -t ~/stats/disk.* | head -n 24) >> $disk
fi

# fill the footer part
cat footer.html >> $disk
