#!/usr/bin/env bash

# Note: currently using pkill, using kill might be better?

# Filter out system processes, display it in dmenu 
process=$(ps -e --format comm -u $USER | grep -vE 'systemd|init|kthreadd|rcu_sched' | sort | uniq | dmenu -fn  'JetBrainsMono Nerd Font:size=10' -nf '#495156'  -nb '#1E2326' -sb '#A7C080' -sf '#1E2326'  -p '󰚌 ')

# Verify that a process was selected before attempting to kill it
if [ -n "$process" ]; then
    # Confirmation prompt before killing the selected process
    response=$(echo -e "cancel\nterm\nkill" | dmenu -p "Signal $process?" -fn  'JetBrainsMono Nerd Font:size=10' -nf '#495156'  -nb '#1E2326' -sb '#A7C080' -sf '#1E2326')

    if [ "$response" = "term" ]; then
        pkill -15 "$process"
    elif [ "$response" = "kill" ]; then
        pkill -9 "$process"
    fi
fi
