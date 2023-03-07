#!/usr/bin/env bash

#Kill the polybar process
killall -q polybar	

#Wait until polybar process is taken down
while pgrep -u $UID -x polybar > /dev/null; do sleep 1; done 

polybar -r matrix 2>&1 | tee -a /tmp/polybar_matrix.log & disown

