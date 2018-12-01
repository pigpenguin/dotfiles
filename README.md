Installation
============

These files are meant to managed by stow. Simply clone the repo into your home
directory, in a file like `.dotfiles` or something then for any of the configs
you want to set up simply `stow folder`. So for instance if you wanted to 
install the irssi config you would run `stow irssi`

Window Manager
==============

Currently the configured window manage is [herbstluftwm](https://herbstluftwm.org)
(which will be refered to as hlwm from now on) the config for that is divided 
into a couple of pieces.

  * **autostart** script which is run on start/reloads of hlwm
  * **scripts/colors** reads the current x colors and sets hlwm to match
  * **scripts/keybind** hlwm keybinding
  * **scripts/rules** defines hlwm's behavior with windows
  * **scripts/panel** starts up polybar and what not
  * **scripts/theme** defines the spacing and borders for hlwm
  * **scripts/workspace** generates workspaces and their keybindings
 
 There is not much need to seperate all these out this way besides maybe organization.
 Color is the only real script which needs to be seperate due to the dynamic wallpaper
 color generation I do.
 
Panel
=====

The currently configured panel is [polybar](https://github.com/jaagr/polybar)
the configuration is pretty standard with the one exception of the window manager
module. Hlwm doesn't seem to play too nice with polybars default wm stuff so I wrote
my own. This is implemented via an [ipc module](https://github.com/jaagr/polybar/wiki/Module:-ipc).
The gist is every time hlwm changes a workspaces status it broadcasts a message which we 
listen to then tell polybar to update. The scripts responsible for all this are:

  * **herbstluftwm/scripts/panel** spawns the script which listens to hlwm and notifies polybar
  * **script/poly-hlwm-tags** is the script polybar calls upon update, it polls the hlwm tag status
  and produces a polybar formatted string
  
Scripts
=======

A collection of homemade scripts to do whatever

  * **flip-monitor** reads the current state of the monitor, if it's inverted return to normal
  if it's normal invert it. Useful for showing people things on the monitor/converting to tablet mode
  * **get-x-color** reads the x database and spits out desired color
  * **poly-hlwm-tags** generates tag data for polybar, probably shouldn't be 
  here as it's only ever called by polybar and not by an end user.
  * **power-menu** opens a rofi menu with power options. Currently can make the computer
  sleep, hibernate, reboot, lock, and power off. Uses systemd to handle sleeping and 
  [sflock](https://github.com/benruijl/sflock) to handle screen locking.
  * **screenshot-selection** using [maim](https://github.com/naelstrof/maim) takes a screenshot
  of a user defined area and copies it to the clipboard for use.
  * **set-wallpaper** sets the wallpaper on the specified monitor, generates a colorscheme
  from it, then updates everything to use said colorscheme. Wallpaper setting done by 
  [nitrogen](https://github.com/l3ib/nitrogen) for nice dual monitor support, 
  color generation handled by [pywal](https://github.com/dylanaraps/pywal) cause it just works.
  * **spotlight** gets a random wallpaper from windows 10 spotlight then sets it as the current
  wallpaper on both monitors. Mostly ripped from [Marius' project](https://gihub.com/mariusknaust/spotlight) 
  
Wal
===

[Pywal](https://github.com/dylanaraps/pywal) is the magic sauce that makes the color generation work.
currently the only config here is a template which generates an emacs theme. It "works" but the color 
schemes it generates are... atrocious. I just the [Moe theme](https://github.com/kuanyui/moe-theme.el) 
it's pretty great.

