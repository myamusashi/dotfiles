clear
neofetch

# Shortcut
alias update="sudo pacman -Syu"
alias unlock="sudo rm /var/lib/pacman/db.lck"

# Environment Variables
set --erase fish_greeting
set -x PATH $PATH $HOME/.local/bin:$PATH
set -x EDITOR 'lvim'
set -x OPENER 'rifle'

function fish_greeting                                                 
   
end
