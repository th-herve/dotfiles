#!/usr/bin/env bash

declare -A saved

saved["mail"]="thibault.herve1@gmail.com"
saved["phone"]="0626514839"
saved["adresse"]="2 rue des Thoniers"
saved["city"]="Larmor Plage"
saved["birth city"]="Pont-L'abbé"
saved["birth date"]="15/01/1996"
saved["Today's date"]=$(date +'%d/%m/%Y')

printSaved() {
    for key in "${!saved[@]}"; do
        echo "$key"
    done
}

key=$(printSaved | dmenu  -fn 'JetBrainsMono Nerd Font:size=10' -nf '#495156'  -nb '#1E2326' -sb '#A7C080' -sf '#1E2326' -i -l 10 -p ' ')

if ! [ -z "$key" ]; then 
    echo -n "${saved["$key"]}" | xsel --clipboard --input
fi
