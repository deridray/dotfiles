#!/usr/bin/env bash
dir="$HOME/.config/rofi/launcher"
theme='config'

## run
rofi \
    -show drun \
    -theme ${dir}/${theme}.rasi
