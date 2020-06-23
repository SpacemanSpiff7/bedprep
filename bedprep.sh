#!/bin/bash
display_usage() { 
	echo "Please include path to BED file." 
    echo "This script sorts, bgzips, and indexes the inputted BED file."
    echo -e "Outputs 2 files: (1) .gz (2) .gz.tbi file.\n"
	echo -e "To only sort BED without compression or indexing, use '-s' flag.\n"
	} 

has_param() {
    local term="$1"
    shift
    for arg; do
        if [[ $arg == "$term" ]]; then
            return 0
        fi
    done
    return 1
}

if [  $# -lt 1 ] 
	then 
		display_usage
		exit 1
	fi 
filename="$(basename $1 .bed)_sorted.bed"
sort -V -k1,1 -k2,2 $1 > $filename

if has_param '-s' "$@"; then
	echo "$1 has been sorted."
	exit 0
fi
bgzip $filename
tbifn="$filename.gz"
tabix -p bed $tbifn

echo "$1 has been sorted, compressed, and indexed"
