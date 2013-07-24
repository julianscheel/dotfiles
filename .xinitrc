#!/bin/sh

xrdb -merge ~/.Xresources
xset s 0 0 -dpms
exec urxvt -ls

