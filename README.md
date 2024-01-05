install packages
sudo pacman -S --needed $(comm -12 <(pacman -Slq | sort) <(sort install.txt)) (using bash shell)

install aur packages
yay -S --needed - < aur.txt
