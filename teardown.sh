#!/bin/bash

for file in $(find . -name "*.dot")
do
	basename=$(basename $file)
	filename="${basename%.*}"
	dotfile=".${filename}"
	dotfile="$HOME/${dotfile}"	
	localfile="${dotfile}.local"

        # If the symbolic link exists
        if [ -L ${dotfile} ]
	then
		if [ "$(readlink -- "$dotfile")" = ${file} ]
		then
			echo "Removing symbolic link to $file"
			rm $dotfile
			if [ -f ${localfile} ]
			then
				echo "Moving $localfile to  $dotfile"
				mv $localfile $dotfile
			fi
		else
			echo "Dot file does not point to $file. No action taken"
		fi
	fi
done
