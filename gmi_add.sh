#!/bin/sh

source ./patch_repo.sh

gmi_add() {
	basename=$(basename "$1")
	echo "Git make install $basename"
	
	patch_repos=(dwm st)

	dir=$(mktemp -d)

	git clone -q --depth 1 "$1" "$dir" >/dev/null 2>&1
	
	basedir=$(pwd)
	cd "$dir" || exit

	if printf '%s\n' "${patch_repos[@]}" | grep -x -q "$basename";
	then
		patch_repo "$basename" "$dir" "$basedir"
	fi

	make -s >/dev/null 2>&1
	make install -s >/dev/null 2>&1
	cd "$basedir" || return ;
}
