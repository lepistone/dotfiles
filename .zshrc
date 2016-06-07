HISTFILE=~/.histfile
HISTSIZE=100000
SAVEHIST=$HISTSIZE

bindkey -e

zstyle :compinstall filename '/Users/lep/.zshrc'

autoload -Uz compinit
compinit

fpath=(/usr/local/share/zsh-completions $fpath)

unalias run-help
autoload run-help
HELPDIR=/usr/local/share/zsh/help
