#!/usr/bin/env bash

app=$1
grid=$2
if [[ "${grid}" = "" ]]; then
  grid='100:100:5:5:90:90'
fi

scratchpad_id=$(yabai -m query --windows | jq ".[] | select(.app==\"${app}\").id")

if [[ "$scratchpad_id" -lt 1 ]]; then
  open /Applications/${app}.app &
  while : ; do
    # Try querying the window ID until the app has launched
    scratchpad_id=$(yabai -m query --windows | jq ".[] | select(.app==\"${app}\").id")
    if [[ "$scratchpad_id" != "" ]]; then
      break
    fi
  done
  yabai -m window --focus "$scratchpad_id"
  yabai -m window --toggle float
  yabai -m window --grid ${grid}
else
  is_minimized=$(yabai -m query --windows --window "$scratchpad_id" | jq '.["is-minimized"]')
  current_space=$(yabai -m query --spaces --space | jq '.index')
  is_focused=$(yabai -m query --windows --window "$scratchpad_id" | jq '.["has-focus"]')

  if [[ "$is_minimized" = "true" || "$is_focused" = "false" ]]; then
    yabai -m window "$scratchpad_id" --space "$current_space"
    yabai -m window --focus "$scratchpad_id"
    yabai -m window --grid ${grid}
  else
    yabai -m window "$scratchpad_id" --minimize
  fi
fi
