#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

# Man, I just want a clean home ;_;

# Move go
if [ -d $HOME/.config/go ]
	export GOPATH=$HOME/.config/go
fi

# Move tex files
if [ -d $HOME/.config/texmf ]
	export TEXMFHOME=$HOME/.config/texmf
fi
