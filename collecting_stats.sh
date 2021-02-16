df --output=source,avail,used,pcent | sed -n 's/ */ /gp' > ~/stats/disk.$(date "+%Y.%m.%d-%H.%M.%S")
iostat -c | sed -n 's/ */ /gp' | tail -n +3 | head -n +2 > ~/stats/cpu.$(date "+%Y.%m.%d-%H.%M.%S")
free | sed -n 's/ */ /gp' | cut -d' ' -f1,3,4 > ~/stats/memory.$(date "+%Y.%m.%d-%H.%M.%S")
