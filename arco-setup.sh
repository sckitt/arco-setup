#!/usr/bin/bash

install_packages () {
    sudo pacman -S $(cat pacman.packages)
    yay -S $(cat yay.packages)
    git clone $(cat aur.packages)
}

main () {
    install_packages
}

main "$@"