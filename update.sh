#!/bin/bash

if [ ! -d draw ]; then
	echo "No 'draw' directory present" >&2
	exit 1
fi

if [ "$(ls draw | grep -Ei '\.jar$' | wc -l)" = 0 ]; then
	exit
fi

for df in draw/*.[jJ][aA][rR]; do
	rf="$(echo "x$(basename -- "$df")" | sed 's/^x//;s/\.jar$/-current.jar/i')"
	cp -uLv -- "$df" "$rf"
done
