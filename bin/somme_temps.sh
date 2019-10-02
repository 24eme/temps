#!/bin/bash

csv=$1

echo "Temps en jours : "
echo "( " $(cat $csv  | awk -F ';' '{print $4 " + "}' | sed 's/,/./' ) " 0 ) / 7 " | bc -l

