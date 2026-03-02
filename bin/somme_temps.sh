#!/bin/bash

csv=$*

echo "Temps en jours : "
echo
cat $csv | grep -v '^Date;' | grep ';' | sed 's/,/./g' | awk -F ';' 'BEGIN{total=0}{	total = total + $4;	clients[$2] = 0.0 + clients[$2] + $4} END{ for (c in clients) { printf("    %-15s %5.2f j (%6.2f h) %5.1f j.fact\n", c, clients[c] / 7, clients[c], int(clients[c] / 3.5) / 2); facturable = facturable + int(clients[c] / 3.5) / 2; } printf("\n    %-15s %5.2f j            %5.1f\n", "TOTAL", total / 7, facturable);}'
#echo "( " $(cat $csv  | awk -F ';' '{print $4 " + "}' | grep -E '^[0-9]' | sed 's/,/./' ) " 0 ) / 7 " | bc -l
