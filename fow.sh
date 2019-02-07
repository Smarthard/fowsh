#!/bin/sh

envvar() {
	if [ -z "${!1}" ]; then
			echo "Environment virable ${1} is unset" >&2 
			exit 1
	fi
}


for arg in $@; do
	ftype=`file "$arg"`

	shopt -s nocasematch
	case "$ftype" in
		
		### RASTER IMAGES
		*PNG*|*GIF*|*JPEG*)
				envvar "FOWSH_RIMAGE" && "$FOWSH_RIMAGE" "$arg" ;;

		### VECTOR IMAGES
		*SVG*)
				envvar "FOWSH_VIMAGE" && "$FOWSH_VIMAGE" "$arg" ;;

		### JAVA ARCHIVE RUNNABLE	
		*JAR*)
				java -jar "$arg" ;;

		### TEXT FILES (code sources like .c or .java included)
		*text*) 
				envvar "EDITOR" && "$EDITOR" "$arg" ;;

		### UNKNOWN FILES
		*)
				echo -e "$ftype\nUnknown file type. Please, spesify open mode" >&2 
				exit 1 ;;
	esac
done
