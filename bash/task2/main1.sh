#! /usr/bin/env bash

source ./lib1.sh

while [ ! -f /tmp/file.txt ]
do
        sleep 2
        echo "File is not exist"
done
echo "File exist"
