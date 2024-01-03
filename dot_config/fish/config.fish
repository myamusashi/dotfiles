clear
rxfetch

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
set -x GDK_BACKEND wayland
set -x QT_QPA_PLATFORM wayland-egl

function fish_greeting                                                 
   
end
