#!/usr/bin/env bash

git_repo_add() {
	dir=$(mktemp -d)
	[ ! -d "$2" ] && mkdir -p "$2" && chown -R "$3:root" "$2"
	chown -R "$3:root" "$dir"
	sudo -u "$3" git clone --depth 1 "$1" "$dir/gitrepo" > /dev/null 2>&1 &&
	sudo -u "$3" cp -rfT "$dir/gitrepo" "$2"
}
