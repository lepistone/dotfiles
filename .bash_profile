# I leave that on for the moment, until I fully grasp the .bash* dance
# across ubuntu and macos.
echo this is ~/.bash_profile

# non interactive? exit now.
if [ -z "$PS1" ]; then
   return
fi

. ~/dotfiles/profile.d/path.sh
. ~/dotfiles/profile.d/completion.sh
. ~/dotfiles/profile.d/prompt.sh
. ~/dotfiles/profile.d/aliases.sh
. ~/dotfiles/profile.d/exports.sh

test -r ~/dotfiles-private/.profile.private && source ~/dotfiles-private/.profile.private

# Shell opts
shopt -s cdspell
shopt -s extglob
shopt -s histappend
shopt -s nocaseglob
shopt -s histappend  # append, not overwrite history

fortune

if [ "$(uname)" == "Darwin" ]; then
	alias ls='ls -pG'
	export PGDATA=/usr/local/var/postgres
fi

if [ "$(uname)" == "Linux" ]; then
        alias xclip="xclip -selection c"
        export PATH="$HOME/.pyenv/bin:$HOME/.rbenv/bin:$PATH"
fi

eval "$(pyenv init -)"
eval "$(rbenv init -)"
