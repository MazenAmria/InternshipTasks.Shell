#!/bin/bash

# record the timestamp
timestamp=$(date "+%Y.%m.%d-%H.%M.%S")

# collect the disk info
df --output=source,avail,used,pcent > ~/stats/disk.$timestamp

# collect the cpu info
iostat -c | tail -n 2 > ~/stats/cpu.$timestamp

# collect the memory info (fields: used [3], free [4])
free | sed -n 's/ */ /gp' | cut -d' ' -f1,3,4 > ~/stats/memory.$timestamp
