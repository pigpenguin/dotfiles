# I have *no idea* why these work if they go here but not in .xprofile?

# Man, I just want a clean home ;_;

# Move go
if [ -d $HOME/.config/go ]
then
	export GOPATH="$HOME/.config/go"
fi

# Move tex files
if [ -d $HOME/.config/texmf ]
then
	export TEXMFHOME=$HOME/.config/texmf
fi

# This probably should be removed.
export PYEV_ROOT=$(pyenv root)

# Configure the monitors
sleep 3
$HOME/.screenlayout/layout.sh
