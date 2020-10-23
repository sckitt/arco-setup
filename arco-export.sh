#!/usr/bin/bash

clear_cache () {
	sudo rm -r $(pwd)/dotfiles/.config/sublime-text-3
}

export_settings () {
    cp -r ~/.config/awesome $(pwd)/dotfiles/.config
    cp ~/.config/GIMP/2.10/gimprc $(pwd)/dotfiles/.config/GIMP/2.10
    cp -r ~/.config/mpv $(pwd)/dotfiles/.config
    cp -r ~/.config/rofi $(pwd)/dotfiles/.config
    cp -r ~/.config/sublime-text-3 $(pwd)/dotfiles/.config
    cp -r ~/.config/terminator $(pwd)/dotfiles/.config
    cp ~/.config/VSCodium/User/settings.json $(pwd)/dotfiles/.config/VSCodium/User
    cp -r ~/.newsboat $(pwd)/dotfiles
    cp -r ~/.themes $(pwd)/dotfiles
    cp -r ~/.w3m $(pwd)/dotfiles
    cp ~/.bashrc-personal $(pwd)/dotfiles/.bashrc-personal
    #cp ~/.bashrc-fr.sh $(pwd)/dotfiles/.bashrc-fr.sh
}

wipe_sensitive () {
    #rm $(pwd)/dotfiles/.newsboat/history.cmdline
    rm -r $(pwd)/dotfiles/.config/sublime-text-3/Local
}

main () {
	clear_cache
    export_settings
    wipe_sensitive
}

main "$@"
