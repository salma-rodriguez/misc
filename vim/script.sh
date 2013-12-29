#!/bin/zsh

REPO=https://github.com
MAIN=~/Downloads/misc/vim
FONT=fontpatcher-symbols.sfd
POWR=~/.vim/bundle/powerline/powerline/config_files/

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

git clone $REPO/gmarik/vundle
git clone $REPO/tpope/vim-fugitive
git clone $REPO/Lokaltog/powerline
git clone $REPO/scrooloose/nerdtree
git clone $REPO/godlygeek/csapprox
git clone $REPO/MarcWeber/vim-addon-mw-utils
git clone $REPO/tomtom/tlib_vim
git clone $REPO/scrooloose/snipmate-snippets
git clone $REPO/garbas/vim-snipmate
git clone $REPO/flazz/vim-colorschemes
git clone $REPO/Lokaltog/powerline-fonts

# fonts

cp powerline-fonts/Inconsolata/Inconsolata\ \
for\ Powerline.otf ~/.fonts/

cp powerline-fonts/SourceCodePro/Sauce\ Code\ \
Powerline\ Medium.otf ~/.fonts/

fc-cache -f ~/.fonts

}

# sudo apt-get install python3-pip
# sudo pip-3.2 install git+git://github.com/Lokaltog/powerline

function load_font {

cd ~/.vim/bundle/powerline/font/
./fontpatcher.py $FONT
mv PowerlineSymbols\ for\ Powerline.otf ~/.fonts
fc-cache -vf ~/.fonts
mv 10-powerline-symbols.conf ~/.config/fontconfig/conf.d

}

function config_powerline {

cd $POWR

sed '35s/default/solarized/' config.json > tmp
cat tmp > config.json; rm tmp

}

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

function term_setup {

cd $MAIN
mkdir -p ~/.config/terminator/
cp config ~/.config/terminator/

}

function clean {

rm -rf ~/.vim
rm -f ~/.vimrc
rm -rf ~/.git_template
rm -rf ~/.config/terminator

}

case "$1" in

	all)
		git_setup
		vim_setup
		config_powerline
		term_setup
		;;

	clean)
	        clean
                ;;

	setup)
		setup
		;;
	vim_setup)
		vim_setup
		;;
	term_setup)
		term_setup
		;;

	git_setup)
		git_setup
		;;

	load_font)
		load_font
		;;

	config_powerline)
		config_powerline
		;;

esac

exit 0
