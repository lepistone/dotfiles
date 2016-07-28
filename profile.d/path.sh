# on mac, no need to add those. To check again on ubuntu.

if [ -d ~/.linuxbrew/bin ]
then
  export PATH="$HOME/.linuxbrew/sbin:$HOME/.linuxbrew/bin:$PATH"
fi

if [ -d ~/Library/Python/2.7/bin ]; then
  export PATH="$HOME/Library/Python/2.7/bin:$PATH"
fi

export PATH="$HOME/bin:/usr/local/sbin:$PATH"

if [ -d /usr/local/texlive/2015basic/bin/x86_64-darwin ]
then
  export PATH=/usr/local/texlive/2015basic/bin/x86_64-darwin:$PATH
fi

if [ -d ~/opt/idea ]
then
  export PATH=~/opt/idea/bin:$PATH
fi
