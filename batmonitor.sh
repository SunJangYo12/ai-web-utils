#!/bin/bash

counter=0
limit=60

while true; do
    status=$(cat /sys/class/power_supply/BAT1/status 2>/dev/null)

    if [ "$status" == "Discharging" ]; then
        counter=$((counter + 2))  # karena sleep 2 detik

        sisa=$((limit - counter))
        if [ $sisa -lt 0 ]; then
            sisa=0
        fi

        notify-send "Warning: shutdown in $sisa sec..."

        if [ "$counter" -ge "$limit" ]; then
            notify-send "Poweroff now!"
            systemctl poweroff
        fi

    else
        # reset kalau charging
        if [ "$counter" -ne 0 ]; then
            notify-send "Charging - shutdown canceled"
        fi
        counter=0
    fi

    sleep 2
done

