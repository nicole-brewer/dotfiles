#!/bin/bash

for file in $(find . -name "*.dot")
do
	basename=$(basename $file)
	filename="${basename%.*}"
	dotfile=".${filename}"
	dotfile="$HOME/${dotfile}"	

        # If the symbolic link exists
        if [ -L ${dotfile} ]
        then
            # if the link doesn't point to the right file
            if [ ! "$(readlink -- "$dotfile")" = ${file} ]
            then 
                echo "Removing and replacing broken link."
                rm $dotfile
                ln -s -v $file $dotfile
            else
                echo "Link to $dotfile -> $linkfile already exists."
            fi
        # if symbolic link doesn't exist
        else
            # Local file exists
            if [ -f ${dotfile} ]
            then
                # and there is already a local file in place.
                if [ -f "${dotfile}.local" ]
                then
                    echo "$dotfile and $dotfile.local already exist. No action taken."
                # else if there is not a local file, make one
                else 
                    # Move give the file a .local extension
                    echo "A local version of ${dotfile} already exists. Moved to ${dotfile}.local"
                    mv $dotfile $dotfile.local
                    ln -s -v $file $dotfile 
                fi
            # Local file doesn't exist so we can simply create the link
            else
                ln -s -v $file $dotfile
            fi
        fi
done
