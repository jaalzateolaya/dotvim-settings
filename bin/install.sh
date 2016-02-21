#!/usr/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

install_plugin=1 # Install vundle
run_plugin_installer=1 # Perform plugins installation
run_plugin_cleaner=1 # Run plugin cleaner before install
quit_at_finished=1 # Quit when finished

help_msg () {
	echo "Usage:"
	echo "	$0 [-v] [-b] [-c] [-q]"
	echo "Options:"
	echo "	-v Do not install (V)undle plugin."
	echo "	-b Do not run (B)undleInstall! into vim."
	echo "	-c Do not run Bundle(C)lean into vim."
	echo "	-q Do not (q)uit vim when finished."
	echo "	-h Show this help and exit."
	echo
	exit 1
}

while getopts :vbcqh opt
do
	case $opt in
		v ) install_plugin=0
			;;
		b ) run_plugin_installer=0
			;;
		c ) run_plugin_cleaner=0
			;;
		q ) quit_at_finished=0
			;;
		h ) help_msg
			;;
		\?) help_msg
			;;
	esac
done

echo "Installing..."

# Install vundle
if [ 1 -eq $install_plugin ]; then
	vundle_dir=~/.vim/bundle/Vundle.vim

	if [ ! -d $vundle_dir ]; then
		git clone https://github.com/VundleVim/Vundle.vim.git $vundle_dir
	fi
fi

# QUESTION: should we use install script instead cp?
# Copy Vimrc to home directory
cp {$DIR/../,~/.}vimrc

# Copy Gvimrc to home directory
cp {$DIR/../,~/.}gvimrc

# Copy vim dir to home directory
if [ ! -d ~/.vim ]; then
	mkdir ~/.vim
fi

cp -r $DIR/../vim/* ~/.vim

# Vim commands to be executed.
commands=( +BundleClean +BundleInstall! +qall )

if [ 0 -eq $run_plugin_cleaner ]; then
	unset commands[0]
fi

if [ 0 -eq $run_plugin_installer ]; then
	unset commands[1]
fi

# If there is 1 element in the array, at this point, it must be +qall, so, don't
# run vim.
if [ ! 1 -eq ${#commands[@]} ]; then
	echo 3 le ${#commands[@]} ${commands[@]}
	if [ 0 -eq $quit_at_finished ]; then
		echo $quit_at_finisheder
		unset commands[2]
	fi

	vim "+let g:session_autoload='no'" ${commands[@]}
fi

echo "Finished!"

