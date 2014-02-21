# non interactive? exit now.

if [ -z "$PS1" ]; then
   return
fi

. ~/dotfiles/profile.d/path.sh
. ~/dotfiles/profile.d/completion.sh
. ~/dotfiles/profile.d/prompt.sh
. ~/dotfiles/profile.d/aliases.sh
. ~/dotfiles/profile.d/exports.sh

test -r ~/.profile.private && source ~/.profile.private

# Shell opts
shopt -s cdspell
shopt -s extglob
shopt -s histappend
shopt -s nocaseglob

fortune

if [ "$(uname)" == "Darwin" ]; then
	alias ls='ls -pG'
#	export PGDATA=/usr/local/var/postgres
fi
