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

# Only displaye 2 directorys deep
export PROMPT_DIRTRIM=2
function _update_ps1() {
    # This needs to run first to get the error of any user command
    if [ $? -eq 0 ]; then
      arrow="\[\e[1;92m\]=>\[\e[0m\]"
    else
      arrow="\[\e[1;31m\]=>\[\e[0m\]"
    fi

    gitstatus=$(git rev-parse --abbrev-ref HEAD 2> /dev/null)

    if [ $? -eq 0 ]; then
      gitstatus="  \[\e[32m\]$gitstatus"
    else
      gitstatus=""
    fi

    if [ ! -z $IN_NIX_SHELL ]; then
      nixstatus="\[\e[31m\]$IN_NIX_SHELL  "
    else
      nixstatus=""
    fi

    export PS1=" \[\e[1m\]$nixstatus\[\e[34m\]\w$gitstatus\[\e[0m\] \n $arrow "
}


if [ "$TERM" != "linux" ]; then
    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi

eval "$(direnv hook bash)"

source /home/corvid/.config/broot/launcher/bash/br

# Until home manager manages bash for me, this sources session variables
source $HOME/.nix-profile/etc/profile.d/hm-session-vars.sh
