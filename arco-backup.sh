#!/usr/bin/bash

clear_cache () {
	sudo rm -r $(pwd)/.config/sublime-text-3
}

export_settings () {
    cp -r ~/.config/awesome $(pwd)/.config
    cp ~/.config/GIMP/2.10/gimprc $(pwd)/.config/GIMP/2.10
    cp -r ~/.config/mpv $(pwd)/.config
    cp -r ~/.config/rofi $(pwd)/.config
    cp -r ~/.config/sublime-text-3 $(pwd)/.config
    cp -r ~/.config/terminator $(pwd)/.config
    cp ~/.config/VSCodium/User/settings.json $(pwd)/.config/VSCodium/User
    cp -r ~/.newsboat $(pwd)
    cp -r ~/.themes $(pwd)
    cp -r ~/.w3m $(pwd)
    cp ~/.bashrc-personal $(pwd)/.bashrc-personal
    #cp ~/.bashrc-fr.sh $(pwd)/.bashrc-fr.sh
}

wipe_sensitive () {
    #rm $(pwd)/.newsboat/history.cmdline
    rm -r $(pwd)/.config/sublime-text-3/Local
}

import_settings () {
    cp -r .config ~
    cp -r .newsboat ~
    cp -r .themes ~
    cp -r .w3m ~
    cp .bashrc-personal ~
    cp .bashrc-fr.sh ~
}

main () {
	clear_cache
    export_settings
    wipe_sensitive
}

main "$@"
