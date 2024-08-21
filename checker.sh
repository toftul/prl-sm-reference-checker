#!/usr/bin/bash

# main file
# mainfile="main.tex"
# smfile="sm.tex"

# Check for correct number of arguments
if [ "$#" -ne 2 ]; then
	echo "Usage: $0 <mainfile> <smfile>"
	exit 1
fi

# Define input files from arguments
mainfile="$1"
smfile="$2"

# extract all the keys in main file
grep -v ^\% $mainfile | grep -oP "\\\\cite(?:\\[[^\\]]+\\])?\\{([^{}]+)\\}" | sed 's/[\]cite[^{]*{\([^}]*\)}.*/\1/' | tr ',' '\n' | sed 's/^[[:space:]]*//' | sort -u >keys_main

# extract all the keys in sm file
grep -v ^\% $smfile | grep -oP "\\\\cite(?:\\[[^\\]]+\\])?\\{([^{}]+)\\}" | sed 's/[\]cite[^{]*{\([^}]*\)}.*/\1/' | tr ',' '\n' | sed 's/^[[:space:]]*//' | sort -u >keys_sm

# create file with extra keys in SM which are absent in the main file
comm -23 keys_sm keys_main >extra_keys_in_sm
# Convert in one line
paste -sd "," extra_keys_in_sm >extra_keys_in_sm_oneline

# Clean up temporary files
rm keys_main keys_sm
