HISTFILE=~/.histfile
HISTSIZE=100000
SAVEHIST=$HISTSIZE

bindkey -e

fpath=(/usr/local/share/zsh-completions $fpath)

zstyle :compinstall filename '/Users/lep/.zshrc'

autoload -Uz compinit && compinit

setopt PROMPT_SUBST
# autoload -U colors && colors
source /usr/local/opt/git/etc/bash_completion.d/git-prompt.sh
precmd () { __git_ps1 "
%F{green}%~%f%(1j. %F{blue}%jj%f.)%(?.. %F{red}%?%f)" "
%# " }

alias g='git'

unalias run-help
autoload run-help
HELPDIR=/usr/local/share/zsh/help
