#!/bin/env bash

wf-recorder_check() {
	if pgrep -x "wf-recorder" > /dev/null; then
			pkill -INT -x wf-recorder
			notify-send "Stopping all instances of wf-recorder" "$(cat /tmp/recording.txt)"
			wl-copy < "$(cat /tmp/recording.txt)"
			exit 0
	fi
}

wf-recorder_check

SELECTION=$(echo -e "screenshot selection\nscreenshot eDP-1\nscreenshot HDMI-A-2\nscreenshot both screens" | fuzzel -d -p "󰄀 " -w 25 -l 6)

IMG="$HOME/Pictures/screenshot/$(date +%Y-%m-%d_%H-%m-%s).png"
VID="$HOME/Videos/recordings/$(date +%Y-%m-%d_%H-%m-%s).mp4"


case "$SELECTION" in
	"screenshot selection")
    -t 3
		grim -g "$(slurp)" "$IMG"
		wl-copy < "$IMG"
		notify-send "Screenshot Taken" "${IMG}"
		;;
	"screenshot eDP-1")
    -t 3
		grim -c -o eDP-1 "$IMG"
		wl-copy < "$IMG"
		notify-send "Screenshot Taken" "${IMG}"
		;;
	"screenshot HDMI-A-2")
    -t 3
		grim -c -o HDMI-A-2 "$IMG"
		wl-copy < "$IMG"
		notify-send "Screenshot Taken" "${IMG}"
		;;
	"screenshot both screens")
    -t 3
		grim -c -o eDP-1 "${IMG//.png/-eDP-1.png}"
		grim -c -o HDMI-A-2 "${IMG//.png/-HDMI-A-2.png}"
		montage "${IMG//.png/-eDP-1.png}" "${IMG//.png/-HDMI-A-2-.png}" -tile 2x1 -geometry +0+0 "$IMG" 
		wl-copy < "$IMG"
		rm "${IMG//.png/-eDP-1.png}" "${IMG/.png/-HDMI-A-2.png}"
		notify-send "Screenshot Taken" "${IMG}"
		;;
*)
	;;
esac
