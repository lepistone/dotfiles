if [ -f /usr/local/etc/bash_completion ]; then
   . /usr/local/etc/bash_completion
fi

export PATH=~/bin:$PATH

fortune

BLACK='\[\e[0;30m\]'
RED="\[\e[0;31m\]"
GREEN='\[\e[0;32m\]'
YELLOW='\[\e[0;33m\]'
BLUE='\[\e[0;34m\]'
PURPLE='\[\e[0;35m\]'
CYAN='\[\e[0;36m\]'
REGULAR='\[\e[m\]'

GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWSTASHSTATE=1
GIT_PS1_SHOWUNTRACKEDFILES=1
GIT_PS1_SHOWUPSTREAM="verbose"
GIT_PS1_SHOWCOLORHINTS=1

#export PS1="\[\e[0;36m\]\u\[\e[0;39m\]@\[\e[0;32m\]\h \[\e[1;33m\]\w\[\e[m\]\$ "

export PS1="${RED}"'$(__git_ps1 "(%s) ")''`hg prompt "[{branch}{status}{update}]" 2>/dev/null`'"${CYAN}\u${REGULAR}@${GREEN}\h ${YELLOW}\w${REGULAR}\$ "
#export PS1="${CYAN}\u${REGULAR}@${GREEN}\h ${YELLOW}\w${REGULAR}\$ "

if [ "$(uname)" == "Darwin" ]; then
	alias ls='ls -pG'
	export HOMEBREW_GITHUB_API_TOKEN=e1cb6a7b237c1930b361dba0d91e06908eb1cb8b
	export PGDATA=/usr/local/var/postgres
else
	# not used to -i
	unalias rm
	unalias cp
	unalias mv
fi

alias grep='grep --color=auto'
alias rgrep='grep -r --color=auto'
alias xgrep='grep -r --color=auto --include=\*xml'
alias pgrep='grep -r --color=auto --include=\*py'
alias pogrep='grep -r --color=auto --include=\*po'
alias itpogrep='grep -r --color=auto --include=\*it.po'
alias ygrep='grep -r --color=auto --include=\*yml'
alias csvgrep='grep -r --color=auto --include=\*csv'
alias fegrep='grep -r --color=auto --include=\*feature'
alias agrep='grep -r --color=auto --include=\*xml --include=\*py --include=\*yml --include=\*csv --include=\*mako'

alias pack="ack --type=python"
alias xack="ack --type=xml"

alias b='bzr'
alias git='hub'
alias g='hub'
