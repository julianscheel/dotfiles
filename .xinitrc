#!/bin/sh

start-pulseaudio-x11
xrdb -merge ~/.Xresources
xset s 0 0 -dpms
exec urxvt -ls

