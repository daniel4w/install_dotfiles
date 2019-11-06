#!/bin/sh

gmi_add() {
	echo "Git make install $(basename "$1")"
	
	dir=$(mktemp -d)

	git clone --depth 1 "$1" "$dir" > /dev/null 2>&1
	
	cd "$dir" || exit
	make > /dev/null 2>&1
	make install > /dev/null 2>&1
	cd /tmp || return ;
}
