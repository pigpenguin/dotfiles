#!/bin/sh

## Author : Aditya Shakya
## Github : adi1090x

SDIR="$HOME/.config/polybar/scripts"

MENU="$( printf "> amber|> blue|> blue-grey|> brown|> cyan|> deep-orange|> deep-purple|> green|> grey|> indigo|> lime|> orange|> pink|> purple|> red|> teal|> yellow" \
      | rofi -sep "|" -dmenu -i -p 'Select' -location 3 -columns 1 -xoffset -28 -yoffset 80 -width 12 -hide-scrollbar -line-padding 4 -padding 20 -lines 10 \
      | cut -c 3-)"
"$SDIR"/colors.sh -"$MENU"
