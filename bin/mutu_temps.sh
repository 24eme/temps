#!/bin/bash

echo "Date;Projet;Description;Temps (en heure);Tache" > temps.csv
cat gabriel.csv | grep -E "^2020-09" >> temps.csv
cat honorine.csv | grep -E "^2020-09" >> temps.csv
cat jb.csv | grep -E "^2020-09" >> temps.csv
cat mame.csv | grep -E "^2020-09" >> temps.csv
cat mathurin.csv | grep -E "^2020-09" >> temps.csv
cat moussa.csv | grep -E "^2020-09" >> temps.csv
cat tangui.csv | grep -E "^2020-09" >> temps.csv
cat vincent.csv | grep -E "^2020-09" >> temps.csv

cat temps.csv | sed 's|VinIGP|VinsIGP|g' | sed 's|Tuenet|TueNet|g' | sed 's|BIVC|Sancerre|g' > temps.csv.tmp

mv temps.csv{.tmp,}
