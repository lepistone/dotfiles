# ~/.bashrc. Apparently, ubuntu executes this on terminals but not
# inside tmux. Looks like this makes things a bit easier to avoid
# duplication in PATH, for example.

# that means I don't load .bash_profile outside of tmux.
# I'm always inside tmux, so why not?

# Since I've yet to grasp the whole .bash* dance across ubuntu and macos,
# I can touch ~/.debug_dotfiles just in case.
if [ -e ~/.debug_dotfiles ]
then
  echo "This is $BASH_ARGV"
fi

# gnome terminal needs this, for confusing reasons
export TERM=xterm-256color
export EDITOR=vim
