#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Import wals colorscheme
(cat ~/.cache/wal/sequences &)

# Create parent directories as needed
alias mkdir='mkdir -p'

# Show colors when listing
alias ls='ls --color'

# Do not care about case when grepping
alias grep='grep -i'

#PS1='[\u@\h \W]\$ '

PATH=$PATH:$HOME/scripts:$HOME/.config/scripts:$HOME/.local/bin

function _update_ps1() {
	  eval "$($GOPATH/bin/powerline-go -error $? -cwd -eval-max-depth 2 -modules "nix-shell,venv,cwd,perms,git,jobs,exit,root,vgo")"
    # eval "$($GOPATH/bin/powerline-go -error $? -eval -modules-right git)"
}

if [ "$TERM" != "linux" ] && [ -f "$GOPATH/bin/powerline-go" ]; then
    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi
