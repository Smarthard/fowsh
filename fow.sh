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

				### LINKS (URLs or domains)
				ip="[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}(:[0-9]+)?"
				url="(http[s]?:\/\/)?[a-zA-Z0-9]+\.[a-zA-Z0-9]{2,}(:[0-9]+)?"
				if [[ "$arg" =~ $ip|$url ]]; then
						${BROWSER:?} "$arg"
				else
						echo -e "$ftype\nUnknown file type. Please, spesify open mode" >&2 
						exit 1
				fi
	esac
done
