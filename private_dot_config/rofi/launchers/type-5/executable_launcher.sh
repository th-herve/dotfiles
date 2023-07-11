#!/usr/bin/env bash

## Author : Aditya Shakya (adi1090x)
## Github : @adi1090x
#
## Rofi   : Launcher (Modi Drun, Run, File Browser, Window)
#
## Available Styles
#
## style-1     style-2     style-3     style-4     style-5

VIM_WIKI_DIR="$HOME/.config/nvim/vimwiki/docs/"
MY_TERM="kitty"
MY_EDITOR="nvim"

dir="$HOME/.config/rofi/launchers/type-5"
theme='style-4'

selected_file=$(find "$VIM_WIKI_DIR" -type f -name "*.md" | xargs -I {} basename {} | sed 's/\.[^.]*$//' | sort | rofi -dmenu -i -p " "  -theme ${dir}/${theme}.rasi -kb-custom-1 Alt+v -mesg "Press Alt+v to open in nvim")

option=$?

if [ -z "$selected_file" ]; then
    exit 0
fi


# Open with nvim, if pressed the -kb-custom-1 (Alt+v), or with glow if enter
# if [[ $option -eq 10 ]]; then

    $MY_TERM $MY_EDITOR "$VIM_WIKI_DIR$selected_file.md"

# else

    # $MY_TERM --hold --execute glow -p -s ~/Documents/ressource/glow_theme.json "$VIM_WIKI_DIR$selected_file.md" | less -R

# fi

