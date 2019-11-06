#!/bin/sh

apt_add() {
	echo "Apt install "$1" "$2"."	
	apt install "$1" -y > /dev/null 2>&1

	[ "$?" -ne 0 ] && echo "Error: apt install "$1" failed."
}
