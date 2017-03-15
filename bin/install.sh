#!/usr/bin/bash

DIR=$( dirname "${BASH_SOURCE[0]}" )/..

install_plugin_manager=1
install_plugins=1
clean_unused_plugins=1
quit_when_finished=1

help_msg () {
	echo "Usage:"
	echo "	$0 [-c] [-i] [-p] [-q] [-h]"
	echo "Options:"
	echo "	-c Do not automatically clean unused plugins."
	echo "	-i Do not install plugin manager."
	echo "	-p Do not automatically install plugins."
	echo "	-q Do not quit vim once finished."
	echo "	-h Show this help and exit."
	echo
	exit 1
}

announce () {
	echo $(date +%c): ${1}...
}

while getopts :vbcqh opt
do
	case $opt in
		v ) install_plugin_manager=0 ;;
		b ) install_plugins=0 ;;
		c ) clean_unused_plugins=0 ;;
		q ) quit_when_finished=0 ;;
		\?) help_msg ;;
	esac
done

announce "Installing plugin manager"
if [ 1 -eq $install_plugin_manager ]; then
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
		https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

# Copy vim dir to home directory
announce "Installing vim files"
VIM_DIR=$HOME/.vim
if [ ! -d $VIM_DIR ]; then
	cp --recursive $DIR/vim $VIM_DIR
else
	find ./vim -exec cp --update --recursive {} $VIM_DIR \;
fi

# Vim commands to be executed.
commands=( +PlugClean +PlugUpdate +qall )

if [ 0 -eq $clean_unused_plugins ]; then
	unset commands[0]
fi

if [ 0 -eq $install_plugins ]; then
	unset commands[1]

	# Projects dir will be used to store plugins with the plugin manager
	VIM_POJECTS_DIR=${XDG_PROJECTS_DIR:-$HOME/Projects/}/vim
	[ -d $VIM_POJECTS_DIR ] && mkdir --parents $VIM_POJECTS_DIR
fi

# If there is 1 element in the array, at this point, it must be +qall, so, don't
# run vim.
if [ ! 1 -eq ${#commands[@]} ]; then
	if [ 0 -eq $quit_when_finished ]; then
		unset commands[2]
	fi

    announce "Launching vim"
	vim "+let g:session_autoload='no'" ${commands[@]}
fi

announce "Finished!"

