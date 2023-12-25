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
set -x OPENAI_API_KEY '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'
set -x GTK_THEME 'Catppuccin-Frappe-Standard-Lavender-dark:dark'

function fish_greeting                                                 
   
end
