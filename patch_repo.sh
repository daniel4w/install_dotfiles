#!/usr/bin/env bash

[ -z "$patches" ] && patches="patches.csv"


patch_repo() {
	([ -f "$3"/"$patches" ] && cp "$3"/"$patches" /tmp/patches.csv) || echo "nothing to patch"
	
	while IFS=, read -r tag name address; do
		case "$tag" in
			"$1")
				echo "Patch $1 with $name"
				curl -s "$address" > "$2"/"$name" >/dev/null 2>&1
				patch -s < "$2"/"$name" >/dev/null 2>&1
		esac
	done < /tmp/patches.csv	
}
