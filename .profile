#!/bin/sh

export EDITOR="vim"

# Specific for each computer
if [ $HOSTNAME == "ginger" ]; then
    export BROWSER="brave-browser"
    export COMPOSITOR="compton"

elif [ $HOSTNAME == "7600" ]; then
    export BROWSER="brave"
    export COMPOSITOR="picom"
fi
