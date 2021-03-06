#!/usr/bin/bash

bug_fixes () {
    # remove persistent wallpaper
	sudo rm /usr/share/backgrounds/arcolinux/arco-wallpaper.jpg

    # pause kernel updates for stability
    sudo find /etc/pacman.conf -type f -exec sed -i 's/#IgnorePkg   =/IgnorePkg   = linux/g' {} \;
}

install_packages () {
    sudo pacman -S $(cat packages.pacman)
    yay -S $(cat packages.yay)
    mkdir -p ~/src && git -C ~/src clone $(cat packages.aur)
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

esync () {
    if [[ $(ulimit -Hn) -ge 524288 ]]; then
        echo "Esync enabled"
    else
        while true; do
            read -p "Esync disabled. Do you want to enable? [y/n]" yn
            case $yn in
                [Yy]* ) echo 'DefaultLimitNOFILE=524288' | sudo tee -a /etc/systemd/system.conf \
                        echo 'DefaultLimitNOFILE=524288' | sudo tee -a /etc/systemd/user.conf
                        break;;
                [Nn]* ) exit;;
                * ) echo "Please answer yes or no.";;
            esac
        done
    fi
}

dxvk () {
    #grep --color=always -n "multilib" /etc/pacman.conf
    if grep -Fxq "[multilib]" /etc/pacman.conf
        then
                echo "String found"
        else
                echo "String not found"
    fi
}

setup_gaming () {
    # mpv https://www.youtube.com/watch?v=-jLCjY7PNig
    esync
    dxvk
}

import_settings () {
    sh arco-import.sh
}

main () {
    #bug_fixes
    #install_packages
    #build_from_source
    #setup_gaming
    #import_settings
}

main "$@"