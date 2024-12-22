#!/usr/bin/env bash

bookmark=("th-herve.fr" 
        "github.com/th-herve/"
        "github.com/th-herve/sline-nvim"
        "github.com/th-herve/dotfiles"
        "github.com/th-herve/dwm_config"
        "github.com/th-herve/java_sio"
        "github.com/RknB64/Cineflix"
        "github.com/th-herve/projet_java_documents"
        "www.nerdfonts.com/cheat-sheet"
        "search.nixos.org/packages"
        "upload.wikimedia.org/wikipedia/commons/1/1b/ASCII-Table-wide.svg"
        "www.google.fr/maps"
    )

site=$(printf "%s\n" "${bookmark[@]}"  | dmenu  -fn 'JetBrainsMono Nerd Font:size=10' -nf '#495156'  -nb '#1E2326' -sb '#A7C080' -sf '#1E2326' -i -l 10 -p '󰈹 ')

if ! [ -z "$site" ]; then 
    firefox -new-tab "https://$site"
fi
