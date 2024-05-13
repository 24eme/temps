#!/bin/bash

DATE=$(cat temps.csv | grep -v "^Date;Client;Description;" | sort | tail -n 1 | cut -d ";" -f 1,1 | sed 's/-//g')

if ! test "$DATE"; then
    echo "Rien à facturer"
    exit;
fi

mkdir temps/$DATE > /dev/null

echo "Copie de temps.csv dans temps/$DATE/temps.csv"

cp temps.csv temps/$DATE/temps.csv

cat temps/$DATE/temps.csv | grep -v "^Date;Projet;Description;" | cut -d ";" -f 2 | sort | uniq | while read projet  
do
    echo "Date;Client;Description;Temps (en heure);Catégorie" > temps/$DATE/"$projet".csv
    cat temps/$DATE/temps.csv | sort | grep ";$projet;" >> temps/$DATE/"$projet".csv
    echo "Création de temps/$DATE/"$projet".csv"
done

echo "Ajout de temps.csv dans temps_historique.csv"

cat temps/$DATE/temps.csv | grep -v "^Date;Client;Description;" >> temps_historique.csv

sort -r temps_historique.csv > temps_historique.csv.tmp
mv temps_historique.csv{.tmp,}

bash bin/recap.sh > temps/$DATE/recap.csv

echo "Réinialisation du fichier temps.csv"
echo "Date;Client;Description;Temps (en heure);Catégorie" > temps.csv
