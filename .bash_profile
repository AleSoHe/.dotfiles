# ~/.bash_profile

export EDITOR="vim"
export BROWSER="brave-browser"
export COMPOSITOR="compton"

[[ -f ~/.bashrc ]] && . ~/.bashrc

if systemctl -q is-active graphical.target && [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]];
then
	exec startx
fi
