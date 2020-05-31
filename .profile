# ~/.bash_profile
# Only for ginger, as 7600 has it's bash_profile
[ $HOSTNAME != "ginger" ] && exit 0

export EDITOR="vim"
export BROWSER="brave-browser"
export COMPOSITOR="compton"

[[ -f ~/.bashrc ]] && . ~/.bashrc

$COMPOSITOR -b
$HOME/bin/wallpaper
