# Suivi des temps consacrés aux projets du 24ème

## Temps

Temps du mois courant : [temps.csv](https://github.com/24eme/temps/blob/master/temps.csv)

Historique des temps depuis le début : [temps_historique.csv](https://github.com/24eme/temps/tree/master/temps_historique.csv)

## Suivi des forfaits

Suivi temps prévus et consommés sur les forfaits convenus : [Voir le tableau](https://github.com/24eme/temps/blob/master/suivi_forfaits.csv)

## Indicateurs

Description des indicateurs suivis :

* Facturé : Montant facturé HT ce mois
* Jours réalisés : Nombre de jours réalisés dans le mois
* Jours restants : Nombre de jours restant connus de développement
* Dépenses : Toutes les dépenses du mois en excluant celle relative à la TVA (PRLV SEPA DGFIP TVA)
* Trésorie NET : Solde du compte déduit du capital, des parts bloqués et de la réserve

[Voir le tableau des indicateurs](https://github.com/24eme/temps/blob/master/indicateurs.csv)

## Processus

```
cat *.csv | grep -v '20XX-XX-XX'           # on vérifie que tout le monde a mis la bonne date
cat *.csv | grep '20XX-XX-XX' >> temps.csv # on aggrège les temps
bash bin/recap.sh                          # récap à mettre dans le pad

vim *.csv                                  # Potentielles corrections

bash bin/archiveTemps.sh                   # archivage des temps
```
