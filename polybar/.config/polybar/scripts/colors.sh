#!/bin/sh

## Author : Aditya Shakya
## Github : adi1090x

PDIR="$HOME/.config/polybar"
LAUNCH="polybar-msg cmd restart"
CONFIG="$PDIR/config"

set_background() {
  sed -i -e "s/bg = .*/bg = $1/g" "$CONFIG"
}

case "$1" in
  "-amber")
    set_background "#E6AE29"
    ;; 
  "-blue")
    set_background "#327BBC"
    ;;
  "-blue-grey")
    set_background "#546e7a"
    ;;
  "-brown")
    set_background "#B16E58"
    ;;
  "-cyan")
    set_background "#00acc1"
    ;;
  "-deep-orange")
    set_background "#F3663A"
    ;;
  "-deep-purple")
    set_background "#753CE8"
    ;;
  "-green")
    set_background "#67B16B"
    ;;
  "-grey")
    set_background "#757575"
    ;;
  "-indigo")
    set_background "#5966BA"
    ;;
  "-lime")
    set_background "#ADB44F"
    ;;
  "-orange")
    set_background "#F99E2B"
    ;;
  "-pink")
    set_background "#E84B84"
    ;;
  "-purple")
    set_background "#974EAA"
    ;;
  "-red")
    set_background "#E75955"
    ;;
  "-teal")
    set_background "#00897b"
    ;;
  "-yellow")
    set_background "#C8AD35"
    ;;
  *)
    echo "Available options:
    -amber		-blue			-blue-grey		-brown
    -cyan		-deep-orange		-deep-purple		-green
    -grey		-indigo			-light-blue		-light-green
    -lime		-orange			-pink			-purple
    -red		-teal			-yellow"
    exit 1
    ;;
esac

$LAUNCH &
