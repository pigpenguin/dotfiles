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

# Do not care about case when grepping
alias grep='grep -i'

function _update_ps1() {
	  eval "$($GOPATH/bin/powerline-go -error $? -eval -cwd-max-depth 2 -modules "nix-shell,venv,cwd,perms,git,jobs,exit,root,vgo")"
}

if [ "$TERM" != "linux" ] && [ -f "$GOPATH/bin/powerline-go" ]; then
    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi

