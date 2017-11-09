HISTFILE=~/.histfile
HISTSIZE=100000
SAVEHIST=$HISTSIZE

bindkey -e

fpath=(/usr/local/share/zsh-completions $fpath)

zstyle :compinstall filename '/Users/lep/.zshrc'

autoload -Uz compinit && compinit

. ~/dotfiles/profile.d/aliases.sh
. ~/dotfiles/profile.d/exports.sh
. ~/dotfiles/profile.d/path.sh

[[ -f ~/.secrets.sh ]] && . ~/.secrets.sh

setopt PROMPT_SUBST
# autoload -U colors && colors
source /usr/local/opt/git/etc/bash_completion.d/git-prompt.sh
GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWSTASHSTATE=1
GIT_PS1_SHOWUNTRACKEDFILES=1
GIT_PS1_SHOWUPSTREAM=(git verbose name)
GIT_PS1_SHOWCOLORHINTS=1
GIT_PS1_DESCRIBE_STYLE="describe"
precmd () { __git_ps1 '
%F{yellow}%~%f%(1j. %F{blue}%jj%f.)%(?.. %F{red}%?%f)' '${VIRTUAL_ENV:+ ("$( basename "${VIRTUAL_ENV}" )")}
%# ' }

source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

unalias run-help
autoload run-help
HELPDIR=/usr/local/share/zsh/help

[[ $- == *i* ]] && source "/usr/local/opt/fzf/shell/completion.zsh" 2> /dev/null
source "/usr/local/opt/fzf/shell/key-bindings.zsh"
