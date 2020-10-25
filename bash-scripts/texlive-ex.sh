#!/bin/bash

while getopts ":d:f:u:s:h" opt; do
    case $opt in
        f | --full)
            sudo apt-get install texlive-full
            ;;
        i | --install)
            sudo apt-get install texlive
            ;;
        u | --remove)
            sudo apt-get purge texlive*
            sudo rm -rf /usr/local/share/texmf
            sudo rm -rf /var/lib/texmf
            sudo rm -rf /etc/texmf
            sudo apt-get remove tex-common --purge
            rm -rf ~/.texlive
            find -L /usr/local/bin -lname /usr/local/texlive/*/bin/* | xargs rm
            ;;
        v | --version)
            texlive --version
            ;;
        \?)
            echo "$usage"
            exit 1
            ;;
    esac
done
