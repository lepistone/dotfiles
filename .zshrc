HISTFILE=~/.histfile
HISTSIZE=100000
SAVEHIST=$HISTSIZE

bindkey -e

fpath=(/usr/local/share/zsh-completions $fpath)

zstyle :compinstall filename '/Users/lep/.zshrc'

autoload -Uz compinit && compinit

setopt PROMPT_SUBST
# autoload -U colors && colors
PS1="
%F{green}%~%f $?
%# "

alias g='git'

unalias run-help
autoload run-help
HELPDIR=/usr/local/share/zsh/help
