#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias rickroll='curl -L http://bit.ly/10hA8iC | bash'
alias please=sudo
eval $(thefuck --alias)

PS1='[\u@\h \W]\$ '
