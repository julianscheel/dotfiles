#!/usr/bin/fish
set cmd (echo Logout\nLock\nPoweroff\nReboot\nSuspend | rofi -dmenu -p "Logout Menu:")
if test -z $cmd
    exit
end

switch $cmd
    case Logout
        i3-msg exit
    case Lock
        ~/scripts/lock-screen.sh
    case Poweroff
        systemctl poweroff
    case Reboot
        systemctl reboot
    case Suspend
        systemctl suspend
end
