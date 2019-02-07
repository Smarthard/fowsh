#!/bin/sh

envvar() {
	if [ -z "${!1}" ]; then
			echo "Environment virable ${1} is unset" >&2 
			exit 1
	fi
}

editor() {
	envvar "EDITOR"
	"$EDITOR" "$1"
}

rimage() {
	envvar "RIMAGE"
	"$RIMAGE" "$1"
}


for arg in $@; do
	ftype=`file "$arg"`

	shopt -s nocasematch
	case "$ftype" in
		
		### RASTER IMAGES
		*PNG*|*GIF*|*JPEG*)
				rimage "$arg" ;;

		### JAVA ARCHIVE RUNNABLE	
		*JAR*)
				java -jar "$arg" ;;

		### TEXT FILES (code sources like .c or .java included)
		*text*) 
				editor "$arg" ;;

		### UNKNOWN FILES
		*)
				echo -e "$ftype\nUnknown file type. Please, spesify open mode" >&2 
				exit 1 ;;
	esac
done
