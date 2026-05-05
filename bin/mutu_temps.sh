#!/bin/bash

echo "Date;Projet;Description;Temps (en heure);Tache";
cat gabriel.csv jb.csv tangui.csv vincent.csv tanguy.csv charlene.csv | grep -Ev "^Date;" | sed 's|VinIGP|VinsIGP|g' | sed 's|Tuenet|TueNet|g' | sed 's|BIVC|Sancerre|g' | sed 's|Plateau-Urbain|PlateauUrbain|g' | sed 's|Commune Mesures|CommuneMesure|g'
