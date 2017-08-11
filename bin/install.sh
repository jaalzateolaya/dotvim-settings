#!/usr/bin/bash

OLD_PWD=$PWD
# cd into the repository
cd $( dirname "${BASH_SOURCE[0]}" )/..

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
	echo -e $(date +%c): ${1}...
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
VIM_DEST="$HOME/.vim"
VIM_SRC=./vim
for file in $(find "$VIM_SRC" -type f); do
	file_dest="$VIM_DEST/${file#$VIM_SRC}"

	git check-ignore -q "$file" && continue

	if [ -e $file_dest -a \
			$(stat --format=%Y $file_dest) -gt $(stat --format=%Y $file) ]; then
		announce "\033[0;31mConflicting file!:\033[0m $file"
		continue
	fi

	announce "Installing ${file#$VIM_SRC}"
	install -D --preserve-timestamps --mode 0600 "$file" "$file_dest"
done

# Install snippets
SNIPPETS_REPO="https://github.com/alexander-alzate/vim-snippets"
SNIPPETS_DEST="${VIM_DEST}/ultisnippets"

if [ ! -d "${SNIPPETS_DEST}/.git" ]; then
	rm --recursive --force "${SNIPPETS_DEST}"
	git clone "$SNIPPETS_REPO" "${SNIPPETS_DEST}"
else
	git -C "${SNIPPETS_DEST}" fetch
	head_rev=$(git -C "${SNIPPETS_DEST}" rev-parse @)
	remote_rev=$(git -C "${SNIPPETS_DEST}" rev-parse @{u})
	rep_status=$(git -C "${SNIPPETS_DEST}" status --short)

	if [ "$head_rev" != "$remote_rev" -o ! -z "$rep_status" ]; then
		announce "\033[0;31mRepository is not up-to-date!:\033[0m ${SNIPPETS_DEST}"
	fi
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

cd "$OLD_PWD"
announce "Finished!"

