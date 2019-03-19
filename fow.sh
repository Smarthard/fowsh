#!/bin/sh

usage() {
	echo "USAGE: $(basename $0) [-o program] [-n pattern] [-t type ...] FILE ..." 1>&2 
	exit 1
}

while getopts "o:n:t:" arg; do
	case "${arg}" in
		o)
				o=${OPTARG} ;;
		n)
				n=${OPTARG} ;;
		t)
				t=${OPTARG} ;;
		*)
				usage
	esac
done
shift $((OPTIND-1))

if [ $# -eq 0 ]; then
	usage
fi

if [ ! -z "$n" -o ! -z "$t" ]; then
	echo "options -n and -t not yet available"
fi


for arg in "$@"; do
	ftype=`file "$arg"`
	
	if [ $# -gt 10 ]; then
		if [ -z "$proceed" ]; then
			echo -n "fowsh is going to open $# files. Would you like to proceed? [y/N] "
			read proceed
		fi

		case "$proceed" in
			y|Y) ;;
			*) break ;;
		esac
	fi

	# forced opening -o
	if [ ! -z "$o" ]; then
		${o} "$arg"
		continue
	fi

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

		### VIDEO
		*video*)
				${FOWSH_VIDEO:?} "$arg" ;;

		### EMPTY FILES (not archives)
		*empty)
				;;

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
