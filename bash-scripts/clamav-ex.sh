#!/bin/bash

while getopts ":d:f:u:s:h" opt; do
    case $opt in
        d)
            clamscan -r --bell -i $optarg --move=/home/chrx/quarantine
            ;;
        f)
            clamscan --bell -i $optarg --move=/home/chrx/quarantine
            ;;
        u)
            freshclam
            ;;
        h)
            clamscan --help
            ;;
        v)
            clamscan --version
            ;;
        \?)
            echo "$usage"
            exit 1
            ;;
    esac
done
