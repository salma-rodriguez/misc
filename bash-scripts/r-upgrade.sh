#!/bin/bash

while getopts ":fiuvh" opt; do
	case ${opt} in
		f | --full)
		    # making sure we don't have leftovers from other package builds
		    sudo apt autoremove -y
		    sudo apt purge -y build-essential
		    sudo apt purge -y r-base r-base-dev r-base-core
		    sudo apt update
		    sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9
		    sudo add-apt-repository 'deb https://cloud.r-project.org/bin/linux/ubuntu focal-cran40/'
		    sudo apt update
		    sudo apt install -y r-base r-base-dev r-base-core
		    sudo apt install -y build-essential
		    ;;
		i | --install)
		    sudo apt-get install texlive
		    ;;
		u | --remove)
		    sudo apt autoremove -y
		    sudo apt purge -y build-essentials
		    sudo apt purge -y r-base r-base-dev r-base-core
		    sudo apt update
		    ;;
		v | --version)
		    R --version
		    ;;
		\?)
		    echo "$usage"
		    exit 1
			    ;;
	esac
	shift
done
