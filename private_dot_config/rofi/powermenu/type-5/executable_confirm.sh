#!/usr/bin/env bash

dir="$HOME/.config/rofi/powermenu/type-5"
theme='style-1'

yes=''
no=''

option=$1

# Confirmation CMD
confirm_cmd() {
	rofi -theme-str 'window {location: center; anchor: center; fullscreen: false; width: 350px;}' \
		-theme-str 'mainbox {children: [ "message", "listview" ];}' \
		-theme-str 'listview {columns: 2; lines: 1;}' \
		-theme-str 'element-text {horizontal-align: 0.5;}' \
		-theme-str 'textbox {horizontal-align: 0.5;}' \
		-dmenu \
		-p 'Confirmation' \
		-mesg 'Are you Sure?' \
		-theme ${dir}/${theme}.rasi
}

# Ask for confirmation
confirm_exit() {
	echo -e "$yes\n$no" | confirm_cmd
}


run_cmd() {
	selected="$(confirm_exit)"
	if [[ "$selected" == "$yes" ]]; then
		if [[ $option == '--shutdown' ]]; then
			systemctl poweroff
		elif [[ $option == '--reboot' ]]; then
			systemctl reboot
		elif [[ $option == '--hibernate' ]]; then
			systemctl hibernate
		elif [[ $option == '--suspend' ]]; then
			mpc -q pause
			amixer set Master mute
			systemctl suspend
		elif [[ $option == '--lock' ]]; then
			i3lock -i $dir/images/beach_poly.png
		elif [[ $option == '--logout' ]]; then
			if [[ "$DESKTOP_SESSION" == 'qtile' ]]; then
                qtile cmd-obj -o cmd -f shutdown
			elif [[ "$DESKTOP_SESSION" == 'bspwm' ]]; then
				bspc quit
			elif [[ "$DESKTOP_SESSION" == 'i3' ]]; then
				i3-msg exit
			elif [[ "$DESKTOP_SESSION" == 'plasma' ]]; then
				qdbus org.kde.ksmserver /KSMServer logout 0 0 0
			fi
		fi
	else
		exit 0
	fi
}

run_cmd
