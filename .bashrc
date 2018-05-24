#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

xmodmap ~/.xmodmaprc
# alias
alias ipconfig='ip -f inet addr'
alias sl='ls'
alias vim='NVIM_LISTEN_ADDRESS=/tmp/nvim_socket nvim'
