#!/bin/bash

usage="
    -s | --setparms
    -i | --install
    -m | --migrate
    -v | --version
    -r | --remove
    -h | --help
"

JULIA=".julia"
MEDIA="/home/chrx"
JULIA_NIGHTLY="julia-latest-linux64.tar.gz"
JULIA_TARGET_PATH=$MEDIA/$JULIA
JULIA_LATEST_URL="https://julialangnightlies-s3.julialang.org/bin/linux/x64/julia-latest-linux64.tar.gz"
JULIA_DOWNLOAD_PATH=$MEDIA/Downloads

function rmjulia() {
    rm -rf $MEDIA/$JULIA
    sudo rm -f /bin/julia /usr/bin/julia
}

function install() {
    JULIA_TARGET_PATH=$MEDIA/$JULIA
    if [ -f /bin/julia ]; then
        sudo rm -rf /bin/julia
    fi
    if [ -f /usr/bin/julia ]; then
        sudo rm -rf /usr/bin/julia
    fi
    cd $JULIA_DOWNLOAD_PATH
    wget -v \
        --no-check-certificate \
        --no-proxy \
        $JULIA_LATEST_URL
    tar -vxzf $JULIA_DOWNLOAD_PATH/$JULIA_NIGHTLY

    JULIA_LATEST=$(ls -rtI *.tar.gz | tail -1)
    rm -vrf $JULIA_TARGET_PATH
    mv -v $JULIA_DOWNLOAD_PATH/$JULIA_LATEST $JULIA_DOWNLOAD_PATH/$JULIA # rename
    mv -v $JULIA_DOWNLOAD_PATH/$JULIA $MEDIA
    rm -vf $JULIA_NIGHTLY

    for destination in /usr/bin/julia /bin/julia; do
        sudo ln -vs $JULIA_TARGET_PATH/bin/julia $destination
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

function save_packages() {
    ls $MEDIA/$JULIA/packages > $HOME/backup.lst
}

while getopts ":simavrh" opt; do
    case ${opt} in
        s | --save_packages)
            save_packages
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
        r | --remove)
            rmjulia
            ;;
        \? | h)
            echo "$usage"
            exit 1
            ;;
    esac
    shift
done

