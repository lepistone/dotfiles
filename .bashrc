# ~/.bashrc. Apparently, ubuntu executes this on terminals but not
# inside tmux. Looks like this makes things a bit easier to avoid
# duplication in PATH, for example.

# that means I don't load .bash_profile outside of tmux.
# I'm always inside tmux, so why not?

# I leave that on for the moment, until I fully grasp the .bash* dance
# across ubuntu and macos.
echo this is ~/.bashrc

# gnome terminal needs this, for confusing reasons
export TERM=xterm-256color
