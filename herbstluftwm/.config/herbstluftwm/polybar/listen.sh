#! /bin/sh

#lock=$XDG_CACHE_HOME/hlwmlisten
lock=$HOME/.cache/hlwmlisten

# This just makes sure there is a single instance
# of this running. I've forgotten exactly how tho

{
flock -n 9 || exit 1

herbstclient -i tag | awk '{system("polybar-msg hook hlwm 1")}'

} 9>$lock

