# Debugging
if [[ -e ~/.debug_dotfiles ]]; then
  echo -n "${(%):-%N} "
  id -un
fi

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

# Brew

HOMEBREW_INSTALL_FROM_API=1

source "/usr/local/opt/kube-ps1/share/kube-ps1.sh"

# Prompt
precmd () { __git_ps1 '
%F{yellow}%~%f%(1j. %F{blue}%jj%f.)%(?.. %F{red}%?%f)' '${VIRTUAL_ENV:+ ("$( basename "${VIRTUAL_ENV}" )")}
%# '
RPROMPT=$(kube_ps1)
}

# Aliases
alias grep='grep --color=auto'
alias g='git'
alias dotfiles='git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'
alias doma='docker-machine'
alias doco='docker-compose'

alias ossl='/usr/local/opt/openssl/bin/openssl'

alias vi='vim'

alias an='ansible'
alias anp='ansible-playbook'

alias bse='brew services'

alias npm0='npm ls --depth=0'

alias ssh='TERM=screen-256color ssh'

alias k='kubectl'
alias kc='kubectx'
alias kns='kubens'

if [[ -x /usr/libexec/java_home ]]; then
  alias java8='export JAVA_HOME=$(/usr/libexec/java_home -F -v 1.8.0); java -version'
  alias java11='export JAVA_HOME=$(/usr/libexec/java_home -F -v 11); java -version'
  alias java17='export JAVA_HOME=$(/usr/libexec/java_home -F -v 17); java -version'

  alias jah='/usr/libexec/java_home'

  export JAVA_HOME=$(/usr/libexec/java_home -F -v 11)
fi
export MAVEN_OPTS='-XX:TieredStopAtLevel=1'

# Environment variables
export LESS=-FXRSqiM
export PYTHONSTARTUP=~/.pystartup
GPG_TTY=$(tty)
FZF_DEFAULT_COMMAND='fd --type f --hidden --exclude .git'
FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# Use newer less if installed for example with brew. For example, this gets
# nicer output in psql by default.
export PAGER="less"
export MANPAGER="less -is"
export GIT_PAGER='/usr/local/share/git-core/contrib/diff-highlight/diff-highlight|less'

export PGDATA=/usr/local/var/postgres   # for postgres installed with brew
export CLOUDSDK_PYTHON=python3

[[ -f ~/.zsh.work.sh ]] && source ~/.zsh.work.sh
[[ -f ~/.secrets.sh ]] && source ~/.secrets.sh

# Path

# prefer brewed ruby
if [ -d /usr/local/opt/ruby/bin ]; then
  export PATH="/usr/local/opt/ruby/bin:$PATH"
fi

# use brewed gems
if [ -d /usr/local/lib/ruby/gems/3.0.0/bin ]; then
  export PATH="/usr/local/lib/ruby/gems/3.0.0/bin:$PATH"
fi

if [ -d $HOME/.cargo/bin ]; then
  export PATH="$HOME/.cargo/bin:$PATH"
fi

if [ -d $HOME/go/bin ]; then
  export PATH="$PATH:$HOME/go/bin"
fi

export PATH="$HOME/.local/bin:/usr/local/sbin:$PATH"

# Prefer Python distribution from python.org
PATH="/Library/Frameworks/Python.framework/Versions/3.9/bin:${PATH}"

if [[ -d $HOME/.pyenv/versions ]]; then
  for dir in $HOME/.pyenv/versions/*; do
    export PATH="$PATH:$dir/bin"
  done
fi

if [[ -d /usr/local/opt/python@3.8/bin ]]; then
  export PATH="$PATH:/usr/local/opt/python@3.8/bin"
fi

if [[ $(uname -s) == 'Darwin' ]]; then
  source /usr/local/etc/bash_completion.d/git-prompt.sh
  BREW_PREFIX="$(brew --prefix)"
  USR_SHARE="${BREW_PREFIX}/share"
  alias ls='ls -G'   # BSD ls understands -G
  export EDITOR=vim
  source "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc"
  source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc'
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
