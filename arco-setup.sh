#!/usr/bin/bash

get_files () {
    cd ~
    wget https://raw.githubusercontent.com/sckitt/arco-setup/master/arco.packages
    wget https://raw.githubusercontent.com/sckitt/arco-setup/master/fancy-bash-promt.sh
    wget https://raw.githubusercontent.com/sckitt/arco-setup/master/.bashrc
}

install_programs () {
    # Install Tixati
    # Download Tutanota
    # Install youtube-dl
    sudo curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl
    sudo chmod a+rx /usr/local/bin/youtube-dl
}

install_packages () {
    sudo dnf install $(cat arco.packages) -y
}

rice_shell () {
    # Source: https://github.com/ChrisTitusTech/scripts/blob/master/fancy-bash-promt.sh
    cd ~
    cat ~/fancy-bash-promt.sh >> ~/.bashrc
}

main () {
    # get_files
    # enable_repositories
    # update_cache
    # install_programs
    # install_packages
    # rice_shell
    # install_proton_builds
}

main "$@"
