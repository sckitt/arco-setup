#!/usr/bin/bash

install_packages () {
    sudo pacman -S $(cat pacman.packages)
    yay -S $(cat yay.packages)
    mkdir -p ~/src && git -C ~/src clone $(cat aur.packages)
}

build_from_source () {
    cd ~/src
    for i in *; do
        if [ -d "${i}" ]; then
            cd "${i}"
            makepkg -si PKGBUILD
            cd ..
        fi
    done
}

bug_fixes () {
    # unstuck wallpaper
	sudo rm /usr/share/backgrounds/arcolinux/arco-wallpaper.jpg

    # hold kernel package for stability
    sudo find /etc/pacman.conf -type f -exec sed -i 's/#IgnorePkg   =/IgnorePkg   = linux/g' {} \;
}

remove_bloatware () {
    sudo pacman -R blueberry
}

main () {
    #install_packages
    #build_from_source
    #bug_fixes
    #remove_bloatware
}

main "$@"