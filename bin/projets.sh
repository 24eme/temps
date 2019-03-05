#!/bin/bash

FILE_TEMPS=temps_historique.csv

if test "$1"; then
    FILE_TEMPS=$1
fi

cat $FILE_TEMPS | cut -d ";" -f 2 | sort | uniq -c | sort -n
