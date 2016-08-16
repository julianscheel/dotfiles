#!/bin/sh
CMD=`echo -e "Logout\nLock\nPoweroff\nReboot\nSuspend" | rofi -dmenu -p "Logout Menu:"`
if [ ! $CMD ]; then
    exit
fi

case $CMD in
    Logout)
        bspc quit ;;
    Lock)
        ~/scripts/lock-screen.sh ;;
    Poweroff)
        systemctl poweroff ;;
    Reboot)
        systemctl reboot ;;
    Suspend)
        systemctl suspend ;;
esac
