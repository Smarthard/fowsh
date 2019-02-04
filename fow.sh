#!/bin/sh

editor() {
	if [ "$EDITOR" = "" ]; then
			echo "Environment virable EDITOR is unset"
			exit 1
	fi
	"$EDITOR" "$1"
}


for arg in $@; do
	case `file "$arg"` in
		*text*) 
				editor "$arg" ;;
		*)
				echo "Unknown file type. Please, spesify open mode" 
				exit 1 ;;
	esac
done
