# Dot Files #

Not much to say, these are just the config files for my machine. Currently
in the process of cleaning them up and commenting etc.

## Window Manager ##

Currently the configured window manage is[herbstluftwm](https://herbstluftwm.org)
(which will be refered to as hlwm from now on) the config for that is divided 
into a couple of pieces.

  * **autostart** script which is run on start/reloads of hlwm
  * **scripts/colors** reads the current x colors and sets hlwm to match
  * **scripts/keybind** hlwm keybindings, currently maybe doing too much?
  * **scripts/rules** defines hlwm's behavior with windows
  * **scripts/panel** starts up polybar and what not
  * **scripts/theme** defines the spacing and borders for hlwm
  * **scripts/workspace** generates workspaces and their keybindings
 
 There is not much need to seperate all these out this way besides maybe organization.
 Color is the only real script which needs to be seperate due to the dynamic wallpaper
 color generation I do.
 
## Panel ##

The currently configured panel is [polybar](https://github.com/jaagr/polybar)
the configuration is pretty standard with the one exception of the window manager
module. Hlwm doesn't seem to play too nice with polybars default wm stuff so I wrote
my own. This is implemented via an [ipc module](https://github.com/jaagr/polybar/wiki/Module:-ipc).
The gist is every time hlwm changes a workspaces status it broadcasts a message which we 
listen to then tell polybar to update. The scripts responsible for all this are:

  * **herbstluftwm/scripts/panel** spawns the script which listens to hlwm and notifies polybar
  * **script/poly-hlwm-tags** is the script polybar calls upon update, it polls the hlwm tag status
  and produces a polybar formatted string
  
## Scripts ##
A collection of homemade scripts to do whatever

  * **get-x-color** reads the x database and spits out desired color
  ***poly-hlwm-tags** generates tag data for polybar, probably shouldn't be 
  here as it's only ever called by polybar and not by an end user.
  * **power-menu** opens a rofi menu with power options. Currently can make the computer
  sleep, hibernate, reboot, and power off. Will add locking soon, and maybe a confirmation
  prompt?
  * **set-wallpaper** sets the wallpaper on the specified monitor, generates a colorscheme
  from it, then updates everything to use said colorscheme. Wallpaper setting done by 
  [nitrogen](https://github.com/l3ib/nitrogen) for nice dual monitor support, 
  color generation handled by [pywal](https://github.com/dylanaraps/pywal) cause it just works.

