DATE=$(cat temps.csv | grep -v "^Date;Projet;Description;" | sort | tail -n 1 | cut -d ";" -f 1,1 | sed 's/-//g')

if ! test "$DATE"; then
    echo "Rien à facturer"
    exit;
fi

mkdir temps/$DATE

echo "Copie de temps.csv dans temps/$DATE/temps.csv"

cp temps.csv temps/$DATE/temps.csv

cat temps/$DATE/temps.csv | grep -v "^Date;Projet;Description;" | cut -d ";" -f 2 | sort | uniq | while read projet  
do
    echo "Date;Projet;Description;Temps (en heure);Tache" > temps/$DATE/"$projet".csv
    cat temps/$DATE/temps.csv | sort | grep ";$projet;" >> temps/$DATE/"$projet".csv
    echo "Création de temps/$DATE/"$projet".csv"
done

echo "Réinialisation du fichier temps.csv"
echo "Date;Projet;Description;Temps (en heure);Tache (pas obligatoire)" > temps.csv