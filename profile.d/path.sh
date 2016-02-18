# on mac, no need to add those. To check again on ubuntu.

if [ -d ~/.linuxbrew/bin ]
then
  export PATH="$HOME/.linuxbrew/sbin:$HOME/.linuxbrew/bin:$PATH"
fi

export PATH="$HOME/bin:/usr/local/sbin:$PATH"
