#!/usr/bin/env bash

currentBattery="$(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep percentage | awk '{ print $2 }')"

echo $currentBattery
