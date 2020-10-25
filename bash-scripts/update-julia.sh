#!/bin/bash

usage="
    -s | --setparms
    -i | --install
    -m | --migrate
    -v | --version
    -h | --help
"

JULIA=".julia"
JULIA_NIGHTLY="julia-latest-linux64.tar.gz"
JULIA_TARGET_PATH="$HOME/$JULIA"
JULIA_LATEST_URL="https://julialangnightlies-s3.julialang.org/bin/linux/x64/julia-latest-linux64.tar.gz"
JULIA_DOWNLOAD_PATH="$HOME/Downloads"
MEDIA="753A-F1FA"

while getopts ":simavh" opt; do
    case ${opt} in
        s | --setparms)
            setparms
            ;;
        i | --install)
            install
            ;;
        m | --migrate)
            migrate
            ;;
        a | --add_packages)
            add_packages
            ;;
        v | --version)
            julia --version
            ;;
        \? | h)
            echo "$usage"
            exit 1
            ;;
    esac
    shift
done

function setparms() {
    JULIA_TARGET_PATH=$2
    JULIA_DOWNLOAD_PATH=$3
}

function install() {
    sudo rm -rf /bin/julia /usr/bin/julia
    sudo cd $JULIA_DOWNLOAD_PATH
    sudo wget \
        --no-check-certificate \
        --no-proxy \
        $JULIA_LATEST_URL
    sudo tar xzf $JULIA_DOWNLOAD_PATH/$JULIA_NIGHTLY

    JULIA_LATEST=$(ls -rtI *.tar.gz | tail -1)
    sudo rm -rf $JULIA_TARGET_PATH
    sudo mv $JULIA_DOWNLOAD_PATH/$JULIA_LATEST $JULIA_DOWNLOAD_PATH/$JULIA
    sudo mv $JULIA_DOWNLOAD_PATH/$JULIA $HOME
    sudo rm -f $JULIA_NIGHTLY

    for destination in /usr/bin/julia /bin/julia; do
        sudo ln -s $JULIA_TARGET_PATH/bin/julia $destination
    done
}

function migrate(){
    sudo mv $JULIA_TARGET_PATH $MEDIA
    for target in /usr/bin/julia /bin/julia; do
        sudo rm -rf $target
    done
    for destination in /usr/bin/julia /bin/julia; do
        sudo ln -s $MEDIA/bin/julia $destination
    done
}

# JULIA_PACKAGES=$(cat $HOME/backup.lst)
# ARRAY=$(readarray -t a < $HOME/backup.lst)
# echo "ARRAY{@}"
# ARRAY=$n read -d  -r -a lines < $HOME/backup.lst

function add_packages() {
    lines="$(cat $HOME/backup.lst)"
    for line in $lines; do
        sudo julia -e "using Pkg; Pkg.add(\"$line\")"
    done
}
