#!/usr/bin/env bash

scratchpad_id=$(yabai -m query --windows | jq '.[] | select(.app=="Slack").id')

if [[ "$scratchpad_id" -lt 1 ]]; then
  open /Applications/Slack.app &
  scratchpad_id=$(yabai -m query --windows | jq '.[] | select(.app=="Slack").id')
  sleep 1
  yabai -m window --focus "$scratchpad_id"
  yabai -m window --toggle float
  yabai -m window --grid 1:1:0:0:1:1
else
  is_minimized=$(yabai -m query --windows --window "$scratchpad_id" | jq '.["is-minimized"]')
  current_space=$(yabai -m query --spaces --space | jq '.index')

  if [[ "$is_minimized" = "true" ]]; then
    yabai -m window "$scratchpad_id" --space "$current_space"
    yabai -m window --focus "$scratchpad_id"
    yabai -m window --grid 1:1:0:0:1:1
  else
    yabai -m window "$scratchpad_id" --minimize
  fi
fi
