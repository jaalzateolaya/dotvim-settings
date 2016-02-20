#!/usr/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Install vundle
vundle_dir=~/.vim/bundle/Vundle.vim

if [ ! -d $vundle_dir ]; then
	git clone https://github.com/VundleVim/Vundle.vim.git $vundle_dir
fi

# QUESTION: should we use install script instead cp?
# Copy Vimrc to home directory
cp {$DIR/../,~/.}vimrc

# Copy Gvimrc to home directory
cp {$DIR/../,~/.}gvimrc

# Copy vim dir to home directory
cp -r {$DIR/../,~/.}vim

vim +BundleClean +BundleInstall! "+let g:session_autoload='no'" +qall
