#!/bin/sh

filesdir=$1
searchstr=$2

# Exits with return value 1 error and print statements if any of the parameters above were not specified
if [ -z "$filesdir" ] || [ -z "$searchstr" ]; then
    echo "filesdir or searchstr not specified"
    exit 1
fi

# Exits with return value 1 error and print statements if filesdir does not represent a directory on the filesystem
if [ ! -d "$filesdir" ]; then
    echo "filesdir does not represent a directory on the filesystem"
    exit 1
fi

filenames=$(ls -1 "$filesdir")
X=$(ls -1 "$filesdir" | wc -l)
Y=$(grep -r "$searchstr" "$filesdir" | wc -l)

echo "The number of files are $X and the number of matching lines are $Y"
