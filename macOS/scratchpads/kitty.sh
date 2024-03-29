#!/usr/bin/env bash

scratchpad_id=$(yabai -m query --windows | jq '.[] | select(.title=="Scratchpad").id')

if [[ "$scratchpad_id" -lt 1 ]]; then
  kitty --title='Scratchpad' | awk '{print $NF}' &
  scratchpad_id=$(yabai -m query --windows | jq '.[] | select(.title=="Scratchpad").id')
  sleep 1
  yabai -m window --focus "$scratchpad_id"
  yabai -m window --toggle float
  yabai -m window --grid 16:16:3:3:10:10
else
  is_minimized=$(yabai -m query --windows --window "$scratchpad_id" | jq '.["is-minimized"]')
  current_space=$(yabai -m query --spaces --space | jq '.index')
  is_focused=$(yabai -m query --windows --window "$scratchpad_id" | jq '.["has-focus"]')

  if [[ "$is_minimized" = "true" || "$is_focused" = "false" ]]; then
    yabai -m window "$scratchpad_id" --space "$current_space"
    yabai -m window --focus "$scratchpad_id"
    yabai -m window --grid 16:16:3:3:10:10
  else
    yabai -m window "$scratchpad_id" --minimize
  fi
fi
