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

alias java7='export JAVA_HOME=$(/usr/libexec/java_home -F -v 1.7); java -version'
alias java8='export JAVA_HOME=$(/usr/libexec/java_home -F -v 1.8); java -version'
alias java9='export JAVA_HOME=$(/usr/libexec/java_home -F -v 9); java -version'
alias java10='export JAVA_HOME=$(/usr/libexec/java_home -F -v 10); java -version'

alias jah='/usr/libexec/java_home'

# Environment variables
LESS=-FXRSq
PYTHONSTARTUP=~/.pystartup
export EDITOR=vim
GPG_TTY=$(tty)
FZF_DEFAULT_COMMAND='fd --type f --hidden --exclude .git'
FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
CLOUDSDK_PYTHON=python
export PGDATA=/usr/local/var/postgres   # for postgres installed with brew
[[ -f ~/.secrets.sh ]] && source ~/.secrets.sh

# Path
if [ -d /usr/local/opt/python@2/bin ]; then
  export PATH="$PATH:/usr/local/opt/python@2/bin"
fi
export PATH="$HOME/.local/bin:/usr/local/sbin:$PATH"

if [[ $(uname -s) == 'Darwin' ]]; then
  source /usr/local/etc/bash_completion.d/git-prompt.sh
  BREW_PREFIX="$(brew --prefix)"
  USR_SHARE="${BREW_PREFIX}/share"
  alias ls='ls -G'   # BSD ls understands -G
else
  if [[ -e /usr/share/git-core/contrib/completion/git-prompt.sh ]]; then
    source /usr/share/git-core/contrib/completion/git-prompt.sh  # fedora
  else
    source /etc/bash_completion.d/git-prompt  # ubuntu
  fi
  BREW_PREFIX=""
  USR_SHARE="/usr/share"
  alias ls='ls --color=auto'   # GNU ls understands --color
fi

source ${USR_SHARE}/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

if [[ -d /usr/local/opt/fzf ]]; then
  [[ $- == *i* ]] && source "/usr/local/opt/fzf/shell/completion.zsh" 2> /dev/null
  source "${BREW_PREFIX}/opt/fzf/shell/key-bindings.zsh"
fi

unset BREW_PREFIX USR_SHARE
