#!/bin/sh


for arg in $@; do
	ftype=`file "$arg"`

	shopt -s nocasematch
	case "$ftype" in
		
		### RASTER IMAGES
		*PNG*|*GIF*|*JPEG*)
				${FOWSH_RIMAGE:?} "$arg" ;;

		### VECTOR IMAGES
		*SVG*)
				${FOWSH_VIMAGE:?} "$arg" ;;

		### JAVA ARCHIVE RUNNABLE	
		*JAR*)
				java -jar "$arg" ;;

		### TEXT FILES (code sources like .c or .java included)
		*text*) 
				${EDITOR:?} "$arg" ;;

		### UNKNOWN FILES
		*)
				echo -e "$ftype\nUnknown file type. Please, spesify open mode" >&2 
				exit 1 ;;
	esac
done
