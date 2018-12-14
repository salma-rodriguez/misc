#!/bin/zsh

REPO=https://github.com
MAIN=~/Downloads/misc/vim

function vim_setup {

cd $MAIN

cp .vimrc ~/

mkdir -p ~/.fonts
mkdir -p ~/.vim/tmp
mkdir -p ~/.vim/undo
mkdir -p ~/.vim/bundle
mkdir -p ~/.vim/colors
mkdir -p ~/.vim/backup

cd ~/.vim/bundle

# bundles
git clone $REPO/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

}

# sudo apt-get install python3-pip
# sudo pip-3.2 install git+git://github.com/Lokaltog/powerline

function git_setup {

cd $MAIN

git config --global diff.tool vimdiff
git config --global merge.tool vimdiff
git config --global difftool.prompt false
git config --global user.name "salma-rodriguez"
git config --global user.email "srodr063@fiu.edu" 
git config --global init.templatedir '~/.git_template'
git config --global credential.helper cache
git config credential.helper 'cache --timeout=3600'                        

mkdir -p ~/.git_template/hooks
cp ctags post-* ~/.git_template/hooks
chmod 755 ~/.git_template/hooks/ctags ~/.git_template/hooks/post-*

}

function clean {

rm -rf ~/.vim
rm -f ~/.vimrc
rm -rf ~/.git_template

}

case "$1" in

	all)
		git_setup
		vim_setup
		;;

	clean)
	        clean
                ;;

	vim_setup)
		vim_setup
		;;

	git_setup)
		git_setup
		;;

esac

exit 0
