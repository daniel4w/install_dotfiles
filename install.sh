#!/usr/bin/env bash

source ./apt_add.sh 
source ./ppa_add.sh
source ./pip_add.sh
source ./gmi_add.sh
source ./git_repo_add.sh

# Set default vars
[ -z "$dotfilesrepo" ] && dotfilesrepo="https://github.com/daniel4w/dotfiles.git"
[ -z "$progs" ] && progs="./install.csv"
usr=$SUDO_USER

### Functions ###

error() { clear; printf "ERROR:\\n%s\\n" "$1"; exit; }

loop() { \
	([ -f "$progs" ] && cp "$progs" /tmp/progs.csv) || error "nothing to install"

	while IFS=, read -r tag program purpose; do
		case "$tag" in
			"apt") apt_add "$program" "$purpose" ;;
			"pip") pip_add "$program" "$purpose" ;;
			"ppa") ppa_add "$program" "$purpose" ;;
			"gmi") gmi_add "$program" "$purpose" ;;
		esac
	done < /tmp/progs.csv ; \
}

loop

git_repo_add "$dotfilesrepo" "/home/$usr/" "$usr"
rm -rf "/home/$usr/README.md" "/home/$usr/.git"
