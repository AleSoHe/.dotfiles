#!/bin/sh

# Specific for my computers
if [ $HOSTNAME == "ginger" ]; then
    export BROWSER="brave-browser"
elif [ $HOSTNAME == "7600" ]; then
    export BROWSER="brave"
fi
