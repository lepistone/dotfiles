# Since I've yet to grasp the whole .bash* dance across ubuntu and macos,
# I can touch ~/.debug_dotfiles just in case.
if [ -e ~/.debug_dotfiles ]
then
  echo "This is $BASH_ARGV"
fi

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
        eval `dircolors $HOME/dotfiles/opt/dircolors-solarized/dircolors.ansi-dark`
fi

if [ -d ~/.rbenv ]; then
  export PATH="$HOME/.rbenv/bin:$PATH"
  eval "$(rbenv init -)"
fi
