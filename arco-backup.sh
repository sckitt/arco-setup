#!/usr/bin/bash

clear_cache () {
	sudo rm -r $(pwd)/.config/sublime-text-3
}

export_settings () {
    cp -r ~/.config/awesome $(pwd)/.config
    cp -r ~/.config/mpv $(pwd)/.config
    cp -r ~/.config/rofi $(pwd)/.config
    cp -r ~/.config/sublime-text-3 $(pwd)/.config
    cp -r ~/.config/terminator $(pwd)/.config
    cp -r ~/.newsboat $(pwd)
    cp -r ~/.w3m $(pwd)
    cp ~/.bashrc-personal $(pwd)/.bashrc-personal
    #cp ~/.bashrc-fr.sh $(pwd)/.bashrc-fr.sh
}

wipe_sensitive () {
    #rm $(pwd)/.newsboat/history.cmdline
    rm -r $(pwd)/.config/sublime-text-3/Local
}

main () {
	clear_cache
    export_settings
    wipe_sensitive
}

main "$@"
