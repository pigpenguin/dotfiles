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

function _update_ps1() {
	  eval "$(powerline-go -error $? -eval -cwd-max-depth 2 -modules "nix-shell,venv,cwd,perms,git,jobs,exit,root,vgo")"
}

if [ "$TERM" != "linux" ] && [ -f "$GOPATH/bin/powerline-go" ]; then
    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi

