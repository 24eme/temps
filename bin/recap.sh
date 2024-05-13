#!/bin/bash

FILE_TEMPS=temps.csv

if test "$1"; then
    FILE_TEMPS=$1
fi

echo "Client;Catégorie;Temps (en heure);Temps (en jours)"
cat $FILE_TEMPS | grep -v "Client;Description;" | cut -d ";" -f 2,4,5 | sed 's/,/./g' | sort | awk -F ";" '{ print $1 ";" $3 ";" $2 }' | awk -F ";" '{ projets[$1 ";" $2] += $3; projets[$1 ";ZZZZZ"] += $3; total +=$3i; }END{for (projet in projets) { printf("%s;%s;%0.1f\n", projet, projets[projet], projets[projet]/7) } printf("ZZZZZ;ZZZZZ;%0.1f\n", total/7); }' | sort | sed -r 's/([;]?)ZZZZZ;/\1TOTAL;/g' | sed 's/\./,/g'
