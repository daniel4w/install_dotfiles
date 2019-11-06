#!/bin/sh

pip_add() {
	echo "Pip install "$1" "$2"."
	pip3 install "$1" > /dev/null 2>&1

	[ "$?" -ne 0 ] && echo "error: pip install $1 failed"
}
