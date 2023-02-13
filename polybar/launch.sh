#!/bin/sh

if [ -z "$(pgrep -x polybar)" ]; then
    BAR="main"
    for m in $(polybar --list-monitors | cut -d":" -f1); do
        MONITOR=$m polybar --reload $BAR &
        sleep 1
    done
else
    polybar-msg cmd restart
fi