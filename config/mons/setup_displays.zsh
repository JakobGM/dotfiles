#!/usr/bin/env zsh
local EXTERNAL_MONITOR='HDMI2'
local INTERNAL_MONITOR='eDP1'

local hdmi_connected=$(mons | grep "$EXTERNAL_MONITOR")
local hdmi_enabled=$(mons | grep "$EXTERNAL_MONITOR    (enabled)")
local internal_enabled=$(mons | grep "$INTERNAL_MONITOR    (enabled)")
local duplicate_mode=$(mons | grep "Mode: duplicate")


echo '-------------------------------'
echo 'Found the following information'
echo $hdmi_enabled
echo $hdmi_connected
echo $internal_enabled
echo '-------------------------------'

if [ $hdmi_connected != '' ] 
then
    if [ $hdmi_enabled != '' ]
    then
        echo "Already connected to external display: $EXTERNAL_MONITOR"

        if [ $internal_enabled -e '' ]
        then
            echo "Internal display $INTERNAL_MONITOR is not activated."
            echo 'Activating it now...'
            # Start the mons daemon in order to automatically start a display if it only detects one monitor
            mons -o
        else
            echo "Internal display $INTERNAL_MONITOR is also already activated"
        fi
    else
        echo "Connecting to external display: $EXTERNAL_MONITOR"

        # Assuming that the laptop screen is to the *right* of the primary display
        mons --primary $EXTERNAL_MONITOR -e right
    fi
else
    echo "External display $EXTERNAL_MONITOR not connected"
    echo "Only using internal monitor"
    mons -o
fi

if [ $hdmi_connected != '' ]
then
    if [ $duplicate_mode != '' ] 
    then
        echo "Duplicate mode is enabled, extending monitors instead"
        mons --primary $EXTERNAL_MONITOR -e right
    fi
fi
