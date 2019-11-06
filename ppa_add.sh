#!/bin/sh

ppa_add() {
	[ "$#" -ne 1 ] && echo 'usage: $0 <ppa_name>' && exit 1

	add-apt-repository "$1" -y > /dev/null 2>&1

	[ "$?" -ne 0 ] && echo "error: add ppa $1 failed"

	exit 0
}
