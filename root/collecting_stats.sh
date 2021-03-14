#!/bin/bash

# record the timestamp
timestamp=$(date "+%Y.%m.%d-%H.%M.%S")

# collect the disk info
(df --output=source,avail,used,pcent) > ~/stats/disk.$timestamp

# collect the cpu info (without headers)
(iostat -c | tail -n +3 | sed -n "s/  */ /gp" | cut -d" " -f2-) > ~/stats/cpu.$timestamp

# collect the memory info
# the "." is used to arrange the labels with the data
(printf "."; free | sed -n 's/  */ /gp' | cut -d' ' -f1,3,4) > ~/stats/memory.$timestamp
