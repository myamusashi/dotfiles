install packages
<p>
  sudo pacman -S --needed $(comm -12 <(pacman -Slq | sort) <(sort install.txt)) (using bash shell)
</p>


install aur packages
<p>
  yay -S --needed - < aur.txt
</p>
