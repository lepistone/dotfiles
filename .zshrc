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

if [[ $(uname -s) == 'Darwin' ]]; then
  source /usr/local/etc/bash_completion.d/git-prompt.sh
  BREW_PREFIX="$(brew --prefix)"
  USR_SHARE="${BREW_PREFIX}/share"
else
  source /etc/bash_completion.d/git-prompt
  BREW_PREFIX=""
  USR_SHARE="/usr/share"
fi

GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWSTASHSTATE=1
GIT_PS1_SHOWUNTRACKEDFILES=1
GIT_PS1_SHOWUPSTREAM=(git verbose name)
GIT_PS1_SHOWCOLORHINTS=1
GIT_PS1_DESCRIBE_STYLE="describe"
precmd () { __git_ps1 '
%F{yellow}%~%f%(1j. %F{blue}%jj%f.)%(?.. %F{red}%?%f)' '${VIRTUAL_ENV:+ ("$( basename "${VIRTUAL_ENV}" )")}
%# ' }

source ${USR_SHARE}/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

unalias run-help
autoload run-help
HELPDIR="${USR_SHARE}/zsh/help"

if [[ -d /usr/local/opt/fzf ]]; then
  [[ $- == *i* ]] && source "/usr/local/opt/fzf/shell/completion.zsh" 2> /dev/null
  source "${BREW_PREFIX}/opt/fzf/shell/key-bindings.zsh"
fi

unset BREW_PREFIX USR_SHARE
