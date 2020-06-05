# Man, I just want a clean home ;_;

# Make sure the new config folders exist
mkdir -p "$XDG_CACHE_HOME"/less
mkdir -p "$XDG_CONFIG_HOME"/less
mkdir -p "$XDG_CONFIG_HOME"/texmf
mkdir -p "$MATHEMATICA_USERBASE"


# Hall of shame
# 
# programs which can't be fixed
#
# - CMake
# - Bash

# Configure the monitors
sleep 3
$HOME/.screenlayout/layout.sh
