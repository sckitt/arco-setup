#!/usr/bin/bash

clear_cache () {
	sudo rm -r $(pwd)/.config/sublime-text-3
}

export_settings () {
    cp -r ~/.config/awesome $(pwd)/.config
    cp -r ~/.config/rofi $(pwd)/.config
    mkdir -p $(pwd)/.config/sublime-text-3
    cp -r ~/.config/sublime-text-3/Packages $(pwd)/.config/sublime-text-3
    cp -r ~/.config/terminator $(pwd)/.config
    cp -r ~/.newsboat $(pwd)
    cp ~/.bashrc-personal $(pwd)/.bashrc-personal
    cp ~/.bashrc-fr.sh $(pwd)/.bashrc-fr.sh
}

main () {
	clear_cache
    export_settings
}

main "$@"
