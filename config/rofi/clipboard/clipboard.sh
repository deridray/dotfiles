#!/usr/bin/env bash
dir="$HOME/.config/rofi/clipboard"
theme='config'

## run
rofi \
    -show clipboard \
    -theme ${dir}/${theme}.rasi
