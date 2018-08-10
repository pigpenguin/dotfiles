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

PS1='[\u@\h \W]\$ '

PATH=$PATH:$HOME/scripts:$HOME/.config/scripts:$HOME/.local/bin
