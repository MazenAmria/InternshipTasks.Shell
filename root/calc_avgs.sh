#!/bin/bash

# define CPU stat page
cpu=/var/www/html/cpu/index.html

# update the page
cat header.html > $cpu
~/calc_avgs.awk $(ls ~/stats/cpu.*) >> $cpu
cat footer.html >> $cpu

# define Memory stat page
mem=/var/www/html/memory/index.html

# update the page
cat header.html > $mem
~/calc_avgs.awk $(ls ~/stats/memory.*) >> $mem
cat footer.html >> $mem

# define Disk stat page
disk=/var/www/html/disk/index.html

# update the page
cat header.html > $disk
~/calc_avgs.awk $(ls ~/stats/disk.*) >> $disk
cat footer.html >> $disk
