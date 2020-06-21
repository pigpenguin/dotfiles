#!/bin/bash

# Remove previously running bars
killall -q polybar

# Wait for the polybar processes to actually die
while pgrep -u $UID -x polybar >/dev/null; 
do 
	sleep 1; 
done

polybar --reload tags &
polybar --reload info &
polybar --reload time &

# In case I ever have a more dynamic setup
# Launch the bar on each monitor
#for m in $(polybar -m | cut -d ":" -f1);do
	#MONITOR=$m polybar --reload example &
#done
