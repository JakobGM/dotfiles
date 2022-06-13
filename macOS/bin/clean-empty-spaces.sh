#!/usr/bin/env bash
two_spaces=$(\
  yabai -m query --spaces --display | \
  jq -re 'map(select(."is-native-fullscreen" == false)) | length > 1' \
)
echo $two_spaces
if [[ "$two_spaces" = "true" ]]; then
  yabai -m query --spaces | \
   jq -re 'map(select(."windows" == [] and ."has-focus" == false).index) | reverse | .[] ' | \
   xargs -I % sh -c 'yabai -m space % --destroy'
fi
