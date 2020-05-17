
# echo history
# https://unix.stackexchange.com/questions/38072/how-can-i-save-the-last-command-to-a-file
# eh
# eh [<number-of-lines>]
eh() {
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

# echo last
# el
# el [<number-of-lines]
el() {
    if [ -n "$1" ]
    then
        fc -ln -$1 | sed "s/^[ \t]*//"
    else

        fc -ln -1 | sed "s/^[ \t]*//"
    fi
}

