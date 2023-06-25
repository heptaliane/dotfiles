# alias
alias ipconfig='ip -f inet addr'
alias ls='ls --color'
alias sl='ls'
alias nvim='NVIM_LSTEM_ADDRESS=/tmp/nvim_socket nvim'
alias sudo='sudo ' # enable complete after sudo statement

# The following lines were added by compinstall

zstyle ':completion:*' completer _complete _ignored
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt '%SAt %p: Hit TAB for more, or the character to insert%s'
zstyle ':completion:*' matcher-list '' 'm:{[:lower:]}={[:upper:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}'
zstyle ':completion:*' menu select=1
zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'
zstyle ':completion:*' use-compctl true
zstyle :compinstall filename '~/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
# End of lines configured by zsh-newuser-install

export EDITOR=nvim
PROMPT='[%F{200}%n%F{white}@%F{010}%c%F{015}]%# '

setopt AUTO_CD
export LSCOLORS='exfxcxdxbxegedagacad'
zstyle ':completion:*' list-colors ''

# xmodmap
# xmodmap ~/.xmodmaprc

# nvm
nvm_script="/usr/share/nvm/init-nvm.sh"
[ -e $nvm_script ] && source $nvm_script

# Load pyenv automatically by appending
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
