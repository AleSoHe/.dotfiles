# ~/.profile

export EDITOR="vim"
export BROWSER="brave-browser"
export COMPOSITOR="compton"

# This line is added as, for some reason, dwm executes without bin in the PATH, 
# which is in the .bashrc
export PATH=$PATH:$HOME/bin
export PATH=$PATH:$HOME/bin/statusbar

[[ -f ~/.bashrc ]] && . ~/.bashrc

$COMPOSITOR -b
$HOME/bin/wallpaper
dwmblocks &
