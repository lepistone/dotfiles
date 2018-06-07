# Debugging
[[ -e ~/.debug_dotfiles ]] && echo ${(%):-%N} && whoami

# Zsh
HISTFILE=~/.histfile
HISTSIZE=100000
SAVEHIST=$HISTSIZE
autoload -Uz compinit && compinit
bindkey -e
setopt PROMPT_SUBST

# Git
GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWSTASHSTATE=1
GIT_PS1_SHOWUNTRACKEDFILES=1
GIT_PS1_SHOWUPSTREAM=(git verbose name)
GIT_PS1_SHOWCOLORHINTS=1
GIT_PS1_DESCRIBE_STYLE="describe"

# Prompt
precmd () { __git_ps1 '
%F{green}%m %F{yellow}%~%f%(1j. %F{blue}%jj%f.)%(?.. %F{red}%?%f)' '${VIRTUAL_ENV:+ ("$( basename "${VIRTUAL_ENV}" )")}
%# ' }

# Aliases
alias grep='grep --color=auto'
alias g='git'

alias doma='docker-machine'
alias doco='docker-compose'

alias goodssl='/usr/local/opt/openssl/bin/openssl'
alias libressl='/usr/local/opt/libressl/bin/openssl'

alias vi='vim'

alias an='ansible'
alias anp='ansible-playbook'

alias bse='brew services'

if [[ -x /usr/libexec/java_home ]]; then
  alias java7='export JAVA_HOME=$(/usr/libexec/java_home -F -v 1.7); java -version'
  alias java8='export JAVA_HOME=$(/usr/libexec/java_home -F -v 1.8); java -version'
  alias java9='export JAVA_HOME=$(/usr/libexec/java_home -F -v 9); java -version'
  alias java10='export JAVA_HOME=$(/usr/libexec/java_home -F -v 10); java -version'

  alias jah='/usr/libexec/java_home'
  export JAVA_HOME=$(/usr/libexec/java_home -F -v 1.8)
fi

# Environment variables
export LESS=-FXRSqiM
PYTHONSTARTUP=~/.pystartup
GPG_TTY=$(tty)
FZF_DEFAULT_COMMAND='fd --type f --hidden --exclude .git'
FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
CLOUDSDK_PYTHON=python

# Use newer less if installed for example with brew. For example, this gets
# nicer output in psql by default.
export PAGER="less"
export MANPAGER="less -is"

export PGDATA=/usr/local/var/postgres   # for postgres installed with brew

[[ -f ~/.zsh.work.sh ]] && source ~/.zsh.work.sh
[[ -f ~/.secrets.sh ]] && source ~/.secrets.sh

# Path

# Python 2 installed with brew, see "brew info python@2"
if [ -d /usr/local/opt/python@2/bin ]; then
  export PATH="$PATH:/usr/local/opt/python@2/bin"
fi

# entry points of Python 2 packages installed outside virtualenvs
if [ -d /Users/lepistone/Library/Python/2.7/bin ]; then
  export PATH="$PATH:/Users/lepistone/Library/Python/2.7/bin"
fi

export PATH="$HOME/.local/bin:/usr/local/sbin:$PATH"

if [[ $(uname -s) == 'Darwin' ]]; then
  source /usr/local/etc/bash_completion.d/git-prompt.sh
  BREW_PREFIX="$(brew --prefix)"
  USR_SHARE="${BREW_PREFIX}/share"
  alias ls='ls -G'   # BSD ls understands -G
  export EDITOR=vim
else
  if [[ -e /usr/share/git-core/contrib/completion/git-prompt.sh ]]; then
    source /usr/share/git-core/contrib/completion/git-prompt.sh  # fedora
  else
    source /etc/bash_completion.d/git-prompt  # ubuntu
  fi
  BREW_PREFIX=""
  USR_SHARE="/usr/share"
  alias ls='ls --color=auto'   # GNU ls understands --color
  alias vi='vimx'
  alias vim='vimx'
  export EDITOR=vimx
fi

source ${USR_SHARE}/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

if [[ -d /usr/local/opt/fzf ]]; then  # brew
  [[ $- == *i* ]] && source "/usr/local/opt/fzf/shell/completion.zsh" 2> /dev/null
  source "${BREW_PREFIX}/opt/fzf/shell/key-bindings.zsh"
fi

if [[ -d /usr/share/fzf/shell ]]; then  # fedora
  source /usr/share/fzf/shell/key-bindings.zsh
fi

unset BREW_PREFIX USR_SHARE
