#!/bin/bash
# File Name: install.sh
# Author: zhenyangze
# mail: zhenyangze@gmail.com
# Created Time: 2017年07月04日 星期二 14时51分50秒
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

mv $HOME/.vim $HOME/.vim_backup 2>/dev/null
mv $HOME/.vimrc $HOME/.vimrc_backup 2>/dev/null

ln -s $DIR $HOME/.vim
ln -s $DIR/vimrc $HOME/.vimrc
ln -s $DIR/vimspector.json $HOME/.vimspector.json

if hash nvim 2>/dev/null; then
	mkdir -p $HOME/.config
	ln -s $HOME/.vim $HOME/.config/nvim
	ln -s $HOME/.vimrc $HOME/.config/nvim/init.vim
fi