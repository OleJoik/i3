#!/bin/bash
focused_window=$(i3-msg -t get_tree | jq '.. | select(.focused? and .type?) | .id')
layout=$(i3-msg -t get_tree | jq '.. | select(.nodes? and .nodes[].id == '$focused_window') | .layout')

echo "Focused Window ID: $focused_window"  # Debug line
echo "Current Layout: $layout"             # Debug line

if [[ $layout == *"splitv"* ]]; then
    i3-msg split h
else
    i3-msg split v
fi
