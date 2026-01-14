#!/bin/sh

if [ $# -ne 2 ]; then
    echo "ERROR: Invalid number of arguments."
    echo "Total number of arguments should be 2."
    echo "The order of the arguments should be:"
    echo "   1) File Path of file to create"
    echo "   2) String to be added to specified file."
    exit 1
fi

writefile=$1
parentname=$(dirname "$writefile")
if [ ! -d ${parentname} ]; then
    mkdir -p ${parentname}
fi
writestr=$2
echo ${writestr} > ${writefile}
if [ $? -ne 0 ]; then
    echo "ERROR: Unable to write ${writestr} to ${writefile}."
    exit 1
fi
