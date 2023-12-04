#!/usr/bin/env bash
rofi_command="rofi -theme $HOME/.config/rofi/powermenu.rasi"

uptime=$(uptime -p | sed -e 's/up //g')

# Options
if [[ "$DIR" == "powermenus" ]]; then
		shutdown="襤"
		reboot="ﰇ"
		lock=""
		suspend="鈴"
		logout=""
	ddir="$HOME/.config/rofi/"
else

# For some reason the Icons are mess up I don't know why but to fix it uncomment section 2 and comment section 1 but if the section 1 icons are mess up uncomment section 2 and comment section 1

	# Buttons
	layout=`cat $HOME/.config/rofi/powermenu.rasi | grep BUTTON | cut -d'=' -f2 | tr -d '[:blank:],*/'`
	if [[ "$layout" == "TRUE" ]]; then
		shutdown="襤"
		reboot="ﰇ"
		lock=""
		suspend="鈴"
		logout=""

	else
		shutdown="襤Shutdown"
		reboot="ﰇ Restart"
		lock=" Lock"
		suspend="鈴Sleep"
		logout=" Logout"
	fi
	ddir="$HOME/.config/rofi/"
fi

# Ask for confirmation
rdialog () {
rofi -dmenu\
    -i\
    -no-fixed-num-lines\
    -p "Are You Sure? : "\
    -theme "$ddir/confirm.rasi"
}

# Display Help
show_msg() {
	rofi -theme "$ddir/askpass.rasi" -e "Options : yes / no / y / n"
}

# Variable passed to rofi
options="$lock\n$suspend\n$logout\n$reboot\n$shutdown"

chosen="$(echo -e "$options" | $rofi_command -p "UP - $uptime" -dmenu -selected-row 0)"
case $chosen in
    $shutdown)
		ans=$(rdialog &)
		if [[ $ans == "yes" ]] || [[ $ans == "YES" ]] || [[ $ans == "y" ]]; then
			systemctl poweroff
		elif [[ $ans == "no" ]] || [[ $ans == "NO" ]] || [[ $ans == "n" ]]; then
			exit
        else
			show_msg
        fi
        ;;
    $reboot)
		ans=$(rdialog &)
		if [[ $ans == "yes" ]] || [[ $ans == "YES" ]] || [[ $ans == "y" ]]; then
			systemctl reboot
		elif [[ $ans == "no" ]] || [[ $ans == "NO" ]] || [[ $ans == "n" ]]; then
			exit
        else
			show_msg
        fi
        ;;
    $lock)
        swaylock -c 000000 --ring-color b4befe --ring-ver-color b4befe --key-hl-color 000000 --inside-color b4befe --inside-ver-color b4befe --inside-clear-color a6e3a1 --ring-clear-color a6e3a1 --ring-wrong-color f38ba8 --inside-wrong-color f38ba8 --bs-hl-color f38ba8 --text-caps-lock-color 000000
        ;;
    $suspend)
		ans=$(rdialog &)
		if [[ $ans == "yes" ]] || [[ $ans == "YES" ]] || [[ $ans == "y" ]]; then
			mpc -q pause
			amixer set Master mute
			sh $HOME/.local/bin/lock
			systemctl suspend
		elif [[ $ans == "no" ]] || [[ $ans == "NO" ]] || [[ $ans == "n" ]]; then
			exit
        else
			show_msg
        fi
        ;;
    $logout)
		ans=$(rdialog &)
		if [[ $ans == "yes" ]] || [[ $ans == "YES" ]] || [[ $ans == "y" ]]; then
      pkill -9 -u gilang
		elif [[ $ans == "no" ]] || [[ $ans == "NO" ]] || [[ $ans == "n" ]]; then
			exit
        else
			show_msg
        fi
        ;;
esac
