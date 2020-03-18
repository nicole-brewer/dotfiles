
# echo the last n terminal commands
# https://unix.stackexchange.com/questions/38072/how-can-i-save-the-last-command-to-a-file
# my fc
# mfc [<number-of-lines>] 
mfc() {
        if [ -n "$2" ]
        then
                fc -ln $1 $2 | sed "s/^[ \t]*//"  # xargs -n1 echo #$(sed '1s/^[[:space:]]*//')
	elif [ -n "$1" ]
	then
		fc -ln $1 | sed "s/^[ \t]*//"  # xargs -n1 echo #$(sed '1s/^[[:space:]]*//')
	else
		fc -ln -1 |  sed "s/^[ \t]*//"  # xargs -n1 echo #$(sed '1s/^[[:space:]]*//') #sed "se1s/^[[:space:]]*//'
	fi
}

