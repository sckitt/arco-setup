#!/usr/bin/bash

clear_cache () {
	sudo rm -r $(pwd)/.config/sublime-text-3
}

export_settings () {
    cp -r ~/.config/awesome $(pwd)/.config
    cp -r ~/.config/mpv $(pwd)/.config
    cp -r ~/.config/rofi $(pwd)/.config
    mkdir -p $(pwd)/.config/sublime-text-3
    cp -r ~/.config/sublime-text-3/Packages $(pwd)/.config/sublime-text-3
    cp -r ~/.config/terminator $(pwd)/.config
    cp -r ~/.newsboat $(pwd)
    mkdir -p $(pwd)/.w3m
    cp ~/.w3m/config $(pwd)/.w3m
    cp ~/.bashrc-personal $(pwd)/.bashrc-personal
    #cp ~/.bashrc-fr.sh $(pwd)/.bashrc-fr.sh
}

wipe_sensitive () {
    sudo rm $(pwd)/.newsboat/history.cmdline
}

main () {
	clear_cache
    export_settings
    wipe_sensitive
}

main "$@"
