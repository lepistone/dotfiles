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
# I don't alias git=hub because that slows dows the git prompt. I can alias g though
alias g='hub'
# and make bash completion work for "g"
__git_complete g __git_main

alias bzr-config='vi .bzr/branch/branch.conf'
alias ls='ls --color'

alias lockscreen='/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend'
