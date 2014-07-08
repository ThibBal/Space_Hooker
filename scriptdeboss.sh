#!/bin/sh

files=$(git diff-index --name-status --cached HEAD | grep -v ^D | cut -c3-)

if files != ""
	then
	for file in files
	do
		if [["$file" =~ [.](php|html|js|txt|json|xml|css|sh)$ ]]
			then
			sed -i -e 's/ *$//g;s/     /    /g;s/^[ \  ]*//g' $file
			git add $file
			echo "$file has been modified"
		fi
	done
fi	