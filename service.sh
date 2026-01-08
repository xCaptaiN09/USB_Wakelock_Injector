#!/system/bin/sh
# Part 1: Power Fix (Prevents Pause Death)
if [ -e /sys/module/snd_usb_audio/parameters/power_save ]; then
    echo 0 > /sys/module/snd_usb_audio/parameters/power_save
fi

# Part 2: Watchdog (Prevents Silence on Connect)
LAST_STATE=0
while true; do
    if grep -qi "USB" /proc/asound/cards; then
        if [ "$LAST_STATE" -eq 0 ]; then
            pkill -f audioserver
            LAST_STATE=1
        fi
    else
        LAST_STATE=0
    fi
    sleep 5
done
