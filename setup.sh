#!/bin/bash

for file in $(find . -type f -name "*.dot");
do
	file=$(readlink -f $file)
	basename=$(basename $file)
	filename="${basename%.*}"
	dotfile=".${filename}"
	dotfile="$HOME/${dotfile}"	

	echo $dotfile
	if [ -f "$dotfile" ]
    then
		if [ -f "${dotfile}.local" ]
		then
			echo "${dotfile}.local already exists. Please resolve this file"
		else
			echo "A local version of ${dotfile} already exists. Moved to ${dotfile}.local"
			mv $dotfile $dotfile.local
			ln -s -v $file $dotfile 
		fi
	else
		ln -s -v $file $dotfile 
    fi
done
