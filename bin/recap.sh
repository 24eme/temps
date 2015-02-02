#!/bin/bash

FILE_TEMPS=temps.csv

if test "$1"; then
    FILE_TEMPS=$1
fi

echo "Projet;Tâche;Temps (en heure)"
cat $FILE_TEMPS | grep -v "Projet;Description;" | cut -d ";" -f 2,4,5 | sed 's/,/./g' | sort | awk -F ";" '{ print $1 ";" $3 ";" $2 }' | awk -F ";" '{ projets[$1][$2] += $3; projets[$1]["ZZZZZ"] += $3; }END{for (projet in projets) { for (task in projets[projet]) {print projet ";" task ";" projets[projet][task] }}}' | sort | sed 's/;ZZZZZ;/;TOTAL;/' | sed 's/\./,/g'
