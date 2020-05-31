# ~/.bash_profile

# Specific for my computers
if [ $HOSTNAME == "ginger" ]; then
    export BROWSER="brave-browser"
elif [ $HOSTNAME == "7600" ]; then
    export BROWSER="brave"
fi

[[ -f ~/.bashrc ]] && . ~/.bashrc

if systemctl -q is-active graphical.target && [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]];
then
	exec startx
fi
