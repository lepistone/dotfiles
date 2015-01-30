alias grep='grep --color=auto'

if [ "$(uname)" == "Linux" ]
then
  alias ack="ack-grep"
fi

alias pack="ack --type=python"
alias xack="ack --type=xml"

# I don't alias git=hub because that slows dows the git prompt. I can alias g though
alias g='hub'
# and make bash completion work for "g"
__git_complete g __git_main

alias ls='ls --color'

alias lockscreen='/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend'

alias wow='git status'
alias such='git'
alias very='git'
