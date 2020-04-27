# I have *no idea* why these work if they go here but not in .xprofile?

# Man, I just want a clean home ;_;

# If the xdg variables are not set, use the defaults
if [ ! -n "${XDG_CACHE_HOME+set}" ]; then
	export XDG_CACHE_HOME="$HOME/.cache"
	#echo "XDG_CACHE_HOME not set, setting to $XDG_CACHE_HOME"
fi

if [ ! -n "${XDG_CONFIG_HOME+set}" ]; then
	export XDG_CONFIG_HOME="$HOME/.config"
	#echo "XDG_CONFIG_HOME not set, setting to $XDG_CONFIG_HOME"
fi

########
# Less #
########

# I'm not actually sure what less keeps in it's history file
mkdir -p "$XDG_CACHE_HOME"/less
mkdir -p "$XDG_CONFIG_HOME"/less
export LESSKEY="$XDG_CONFIG_HOME"/less/lesskey
export LESSHISTFILE="$XDG_CACHE_HOME"/less/history

###############
# Mathematica #
###############

# There is also .Wolfram and "Wolfram Mathematica"
# todo: sort that out

export MATHEMATICA_USERBASE="$XDG_CONFIG_HOME"/mathematica
mkdir -p "$MATHEMATICA_USERBASE"

# Hall of shame
# 
# programs which can't be fixed
#
# - CMake
# - Bash

# Move go
if [ -d $HOME/.config/go ]
then
	export GOPATH="$XDG_CONFIG_HOME"/go
fi

# Move tex files
if [ -d $HOME/.config/texmf ]
then
	export TEXMFHOME="$XDG_CONFIG_HOME"/texmf
fi

# This probably should be removed.
export PYEV_ROOT=$(pyenv root)


# Configure the monitors
sleep 3
$HOME/.screenlayout/layout.sh
