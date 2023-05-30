#!/bin/bash
# rofi script that allow to select and open a vimwiki,
# either in nvim for modification
# or glow to read only

# Path to your Vim wiki directory
VIM_WIKI_DIR="/home/adiantum/.config/nvim/vimwiki/"
MY_TERM="kitty"
MY_EDITOR="nvim"

# Search for wiki files and display them in Rofi, also define a custom keybind: Alt+v
selected_file=$(find "$VIM_WIKI_DIR" -type f -name "*.md" | xargs -I {} basename {}  | sort | rofi -dmenu -i -p " " -kb-custom-1 Alt+v)

# Open the selected file in Neovim
option=$?

if [ -z "$selected_file" ]; then
    exit 0
fi


# Open with nvim, if pressed the -kb-custom-1 (Alt+v), or with glow if enter
if [[ $option -eq 10 ]]; then

    $MY_TERM $MY_EDITOR "$VIM_WIKI_DIR$selected_file"

else

    $MY_TERM --hold --execute glow -p -s ~/Documents/ressource/glow_theme.json "$VIM_WIKI_DIR$selected_file" | less -R

fi

