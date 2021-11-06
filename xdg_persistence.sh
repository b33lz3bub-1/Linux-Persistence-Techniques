#!/bin/bash

if [ $1 -z ]
then
        echo "$0 <binary file>"
        exit 1
fi

HOME=$HOME
printf "[Desktop Entry]\nType=Application\nName=Shell\nExec=$HOME/$1\n" | sudo tee /etc/xdg/autostart/shell.desktop

sudo mv /etc/xdg/autostart/shell.desktop /usr/share/applications/shell.desktop

gtk-launch shell

