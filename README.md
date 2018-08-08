Dot Files
=========

Not much to say, these are just the config files for my machine. Currently
in the process of cleaning them up and commenting etc.

Window Manager
--------------

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
