#!/bin/sh

option1=" Lock"
option2=" Logout"
option3=" Reboot"
option4=" Shutdown"

options="$option1\n$option2\n$option3\n$option4"

choice=$(echo "$options" | wofi -dmenu -i -L 5 -w 1 -p "Power Menu")

#echo $choice
case $choice in
	$option1)
		~/Coding/scripts/lock.sh ;;
	$option2)
		swaymsg exit ;;
	$option3)
		systemctl reboot ;;
	$option4)
		systemctl poweroff ;;
esac
