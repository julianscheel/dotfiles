#!/bin/sh

kbd_backlight='/sys/class/leds/asus::kbd_backlight'
brightness=`cat $kbd_backlight/brightness`
max_brightness=`cat $kbd_backlight/max_brightness`

case $1 in
    +)
        if [ $brightness -lt $max_brightness ]
        then
            echo `expr $brightness + 1` > $kbd_backlight/brightness
        fi;
        ;;
    -)
        if [ $brightness -gt 0 ]
        then
            echo `expr $brightness - 1` > $kbd_backlight/brightness
        fi;
        ;;
    [0-9]*)
        echo $1 > $kbd_backlight/brightness
        ;;
    *)
        echo $brightness/$max_brightness
        ;;
esac
