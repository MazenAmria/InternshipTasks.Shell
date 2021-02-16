df --output=source,avail,used,pcent > ~/stats/disk.$(date "+%Y.%m.%d-%H.%M.%S")
iostat -c | tail -n +3 | head -n +2 > ~/stats/cpu.$(date "+%Y.%m.%d-%H.%M.%S")
free | sed -n 's/ */ /gp' | cut -d' ' -f1,3,4 | sed -n 's/ /\t/gp' > ~/stats/memory.$(date "+%Y.%m.%d-%H.%M.%S")
