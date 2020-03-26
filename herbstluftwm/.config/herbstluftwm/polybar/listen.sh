#! /bin/sh

lock=$HOME/.cache/hlwmlisten

{
flock -n 9 || exit 1

herbstclient -i tag | awk '{system("polybar-msg hook hlwm 1")}'

} 9>$lock

