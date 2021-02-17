#!/bin/bash

cat header.html > /var/www/html/cpu/index.html
~/calc_avgs.awk $(ls ~/stats/cpu.*) >> /var/www/html/cpu/index.html
cat footer.html >> /var/www/html/cpu/index.html

cat header.html > /var/www/html/memory/index.html
~/calc_avgs.awk $(ls ~/stats/memory.*) >> /var/www/html/memory/index.html
cat footer.html >> /var/www/html/memory/index.html

cat header.html > /var/www/html/disk/index.html
~/calc_avgs.awk $(ls ~/stats/disk.*) >> /var/www/html/disk/index.html
cat footer.html >> /var/www/html/disk/index.html
