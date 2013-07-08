#!/bin/sh

./scripts/add_720p
./scripts/scale_full_aspect
xrdb -merge ~/.Xresources
xset s 0 0
exec urxvt -ls

