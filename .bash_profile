# ~/.bash_profile

export EDITOR="vim"

# Specific for each computer
if [ $HOSTNAME == "ginger" ]; then
    export BROWSER="brave-browser"
    export COMPOSITOR="compton"

elif [ $HOSTNAME == "7600" ]; then
    export BROWSER="brave"
    export COMPOSITOR="picom"
fi

[[ -f ~/.bashrc ]] && . ~/.bashrc

if systemctl -q is-active graphical.target && [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]];
then
	exec startx
fi
