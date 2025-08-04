#!/bin/bash

csv=$1

echo -n "Temps en jours : "
echo "( " $(cat $csv  | awk -F ';' '{print $4 " + "}' | grep -E '^[0-9]' | sed 's/,/./' ) " 0 ) / 7 " | bc -l

