#!/bin/sh
grim -g "$(slurp -o -c '#cc241dff')" -t ppm - | satty --filename - --fullscreen --output-filename ~/Pictures/screenshot-$(date '+%Y%m%d-%H:%M:%S').png
