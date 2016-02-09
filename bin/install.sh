#!/usr/bin/bash

# FIXME: CWD dependency MUST be fixed.
# Copy Vimrc to home directory
cp {,~/.}vimrc
# Copy Gvimrc to home directory
cp {,~/.}gvimrc

vim +BundleClean +BundleInstall! +q
