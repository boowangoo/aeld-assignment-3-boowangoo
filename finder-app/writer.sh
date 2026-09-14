#!/bin/sh

writefile=$1
writestr=$2

# Exits with value 1 error and print statements if any of the arguments above were not specified
if [ -z "$writefile" ] || [ -z "$writestr" ]; then
    echo "writefile or writestr not specified"
    exit 1
fi

filedir=$(dirname "$writefile")
if [ ! -d "$filedir" ]; then
    mkdir -p "$filedir"
fi

echo "$writestr" > "$writefile"