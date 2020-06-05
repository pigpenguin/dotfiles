#
# ~/.bashrc
#

PATH=$PATH:$HOME/scripts:$HOME/.config/scripts:$HOME/.local/bin


# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Create parent directories as needed
alias mkdir='mkdir -p'

# Show colors when listing
alias ls='ls --color'

# Grep should be colorfull and case insensitive
alias grep='grep --color=auto -i'

# Ask me before overwriting things
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -I'

# Diff properly please
# colordiff colors output
# -b ignore changes to whitespace
# -B ignore new blank lines
alias diff='colordiff -b -B'

#Kitten specific stuff
alias icat="kitty +kitten icat"


if [ -e $HOME/.nix-profile/etc/profile.d/nix.sh ];
then
	. $HOME/.nix-profile/etc/profile.d/nix.sh;
fi

function _update_ps1() {
	  eval "$(powerline-go -error $? -eval -cwd-max-depth 2 -modules "nix-shell,venv,cwd,perms,gitlite,jobs,exit,root,vgo")"
}


if [ "$TERM" != "linux" ] && [ -x "$(command -v powerline-go)" ]; then
    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi

eval "$(direnv hook bash)"

source /home/corvid/.config/broot/launcher/bash/br
