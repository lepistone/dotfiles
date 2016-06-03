alias grep='grep --color=auto'

alias g='git'
__git_complete g __git_main

alias ls='ls --color'

alias lockscreen='/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend'

alias gpg='gpg2'

alias doma='docker-machine'
complete -F _docker-machine doma

alias doco='docker-compose'
complete -F _docker-compose doco

alias bro='google-chrome --incognito $(docker-compose port odoo 8069)'

alias goodssl='/usr/local/opt/openssl/bin/openssl'
alias libressl='/usr/local/opt/libressl/bin/openssl'
