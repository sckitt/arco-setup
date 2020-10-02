#!/usr/bin/bash

install_programs () {
    # Install Tixati
    # Download Tutanota
    # Install youtube-dl
    sudo curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl
    sudo chmod a+rx /usr/local/bin/youtube-dl
}

install_packages () {
    sudo pacman -S $(cat packages.pacman)
    yay -S $(cat packages.yay)
}

rice_shell () {
    # Source: https://github.com/ChrisTitusTech/scripts/blob/master/fancy-bash-promt.sh
    cd ~
    cat ~/fancy-bash-promt.sh >> ~/.bashrc
}

main () {
    # install_programs
    # install_packages
    # rice_shell
}

main "$@"
