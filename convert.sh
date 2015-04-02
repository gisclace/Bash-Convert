#!/bin/bash

dollar=0.759936165
Yen=0.00907287788
Livre=1.18253667
Franc=0.152449
Peter_rouge=5.80
clear
echo "Welcome sur l'ultimate convertisseur pouri des Gnous"
echo "made by Gislace, corrected by canadiandoom"
Menu()
{
  local -a menu fonc
  local titre nbchoix
  # Constitution du menu
  if [[ $(( $# % 1 )) -ne 0 ]] ; then
     echo "$0 - Menu invalide" >&2
     return 1
  fi
  titre="$1"
  shift 1
  set "$@" "return 0" "Sortie"
  while [[ $# -gt 0 ]]
  do
     (( nbchoix += 1 ))
     fonc[$nbchoix]="$1"
     menu[$nbchoix]="$2"
     shift 2
  done
  # Affichage menu
  PS3="Votre choix ? "
  while :
  do
     echo
     [[ -n "$titre" ]] && echo -e "$titre\n"
     select choix in "${menu[@]}"
     do
        if [[ -z "$choix" ]]
           then echo -e "\nChoix invalide"
           else eval ${fonc[$REPLY]}
        fi
        break
     done || break
  done
}
# les taux de convertion
les_taux()
{
clear
echo ""
echo "Voici les taux de convertion:"
echo ""
echo "1 dollar américain = 0.759936165 euros"
echo "1 yen japonais = 0.00907287788 euros"
echo "1 livre sterling = 1.18253667 euros"
echo "1 Peter rouge = 5.80 euro"
echo ""
read -p "appuis sur entrée pour continuer"
clear 
}
#Convertion € devise
euro_devise ()
{
clear
echo ""
read -p "tu veux convertir combien d'euros?:" valeur
echo "tu veux convertir $valeur € en:"
echo ""
echo "1) Dollar"
echo "2) Yen"
echo "3) Livre"
echo "4) Franc"
echo "5) Peter Rouge"
echo ""
echo -n "tapes ton choix:"
read choix
if [ "$choix" = 1 ] ; then
resultat=$(echo "scale=2; ($valeur/$dollar)" | bc -l)
echo ""
echo "$valeur Euro est donc égale à $resultat Dollars"
fi
if [ "$choix" = 2 ] ; then
resultat=$(echo "scale=2; ($valeur/$Yen)" | bc -l)
echo ""
echo "$valeur Euro est donc égale à $resultat Yens"
fi
if [ "$choix" = 3 ] ; then
resultat=$(echo "scale=2; ($valeur/$Livre)" | bc -l)
echo ""
echo "$valeur Euro est donc égale à $resultat Livres"
fi
if [ "$choix" = 4 ] ; then
resultat=$(echo "scale=2; ($valeur/$Franc)" | bc -l)
echo ""
echo "$valeur Euro est donc égale à $resultat Franc"
fi
if [ "$choix" = 5 ] ; then
resultat=$(echo "scale=2; ($valeur/$Peter_rouge)" | bc -l)
echo ""
echo "$valeur Euro est donc égale à $resultat Peter Rouge"
fi
echo ""
read -p "appuis sur entrée pour continuer"
clear 
}
#Convertion devise € 
devise_euro ()
{
clear
echo ""
read -p "tu veux convertir combien en euros?:" valeur
echo "tu veux convertir $valeur de quelle monaie en €:"
echo ""
echo "1) Dollar"
echo "2) Yen"
echo "3) Livre"
echo "4) Franc"
echo "5) Peter Rouge"
echo ""
echo -n "tapes ton choix:"
read choix
if [ "$choix" = 1 ] ; then
resultat=$(echo "scale=2; ($valeur*$dollar)" | bc -l)
echo ""
echo "$valeur Dollar est donc égale à $resultat Euro"
fi
if [ "$choix" = 2 ] ; then
resultat=$(echo "scale=2; ($valeur*$Yen)" | bc -l)
echo ""
echo "$valeur Yen est donc égale à $resultat Euro"
fi
if [ "$choix" = 3 ] ; then
resultat=$(echo "scale=2; ($valeur*$Livre)" | bc -l)
echo ""
echo "$valeur Livre est donc égale à $resultat Euro"
fi
if [ "$choix" = 4 ] ; then
resultat=$(echo "scale=2; ($valeur*$Franc)" | bc -l)
echo ""
echo "$valeur Franc est donc égale à $resultat Euro"
fi
if [ "$choix" = 5 ] ; then
resultat=$(echo "scale=2; ($valeur*$Peter_rouge)" | bc -l)
echo ""
echo "$valeur Peter Rouge est donc égale à $resultat Euro"
fi
echo ""
read -p "appuis sur entrée pour continuer"
clear 
}
# Menu
Menu \
  "Menu"                           			\
  les_taux    "Voir les taux de convertions"        	\
  euro_devise "Convertir € en devise"			\
  devise_euro    "Convertir devise en €"             	\
