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
GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWSTASHSTATE=1
GIT_PS1_SHOWUNTRACKEDFILES=1
GIT_PS1_SHOWUPSTREAM="verbose"
GIT_PS1_SHOWCOLORHINTS=1
GIT_PS1_DESCRIBE_STYLE="describe"
precmd () { __git_ps1 "
%F{green}%~%f%(1j. %F{blue}%jj%f.)%(?.. %F{red}%?%f)" "
%# " }

alias g='git'

unalias run-help
autoload run-help
HELPDIR=/usr/local/share/zsh/help
