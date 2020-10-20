#!/usr/bin/bash

install_packages () {
    sudo pacman -S $(cat pacman.packages)
    yay -S $(cat yay.packages)
    mkdir -p ~/src && git -C ~/src clone $(cat aur.packages)
}

build_from_source () {
    #cd ~/src
    #for $i in $(pwd) {
    #    cd $i && makepkg -si PKGBUILD && cd ..
    #}
}

bug_fixes () {
	sudo rm /usr/share/backgrounds/arcolinux/arco-wallpaper.jpg
}

remove_bloatware () {
    sudo pacman -R blueberry
}

main () {
    install_packages
    #build_from_source
    bug_fixes
    remove_bloatware
}

main "$@"