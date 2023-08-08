#!/usr/bin/env bash

#Kill the polybar process
killall -q polybar	

#Wait until polybar process is taken down
while pgrep -u $UID -x polybar > /dev/null; do sleep 1; done 

#polybar -r laptop_monitor_bottom 2>&1 | tee -a /tmp/polybar_matrix.log & disown

polybar -r laptop_monitor_bottom &

# If a monitor is connected in HDMI then use the first config else use the second one
if [[ $(xrandr -q | grep "HDMI-1-1 connected") ]]; then
    polybar -r external_monitor_bottom &
fi


#if [[ $(xrandr -q | grep "HDMI-1-1 connected") ]]; then
    #polybar -r external_monitor_bottom 2>&1 | tee -a /tmp/polybar_matrix.log & disown
#fi
