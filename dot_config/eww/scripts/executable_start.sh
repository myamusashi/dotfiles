#!/bin/bash
pkill eww
eww daemon
eww open notifications_popup
~/.config/eww/scripts/notifications.py &
