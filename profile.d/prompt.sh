#
# Prompt
# Stolen from
#   https://github.com/jacobian/dotfiles
#   https://github.com/mitsuhiko/dotfiles/blob/master/bash/bashrc
#   https://gist.github.com/293517/a2e5837fec26017a03f8c5440213790d3a6b0edf
#

GRAY="240"
PINK="5"
GREEN="2"
ORANGE="3"
RED="1"

GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWSTASHSTATE=1
GIT_PS1_SHOWUNTRACKEDFILES=1
GIT_PS1_SHOWUPSTREAM="verbose"
GIT_PS1_SHOWCOLORHINTS=1

_lastcommandfailed() {
  code=$?
  if [ $code != 0 ]; then
    echo -n $'\033[41m\033[39mexited '
    echo -n $code
    echo -n $'\033[0m '
  fi
}

_backgroundjobs() {
  jobs|python -c 'if 1:
    import sys
    items = ["\033[36m%s\033[37m" % x.split()[2]
             for x in sys.stdin.read().splitlines()]
    if items:
      if len(items) > 2:
        string = "%s, and %s" % (", ".join(items[:-1]), items[-1])
      else:
        string = ", ".join(items)
      print("\033[38;5;240m running %s" % string)
  '
}

function _clr {
    echo "\\[\\e[0m\\]"
}
function _fg {
    echo "\\033[38;5;"$1"m"
}
function _bg {
    echo "\\033[48;5;"$1"m"
}

export BASEPROMPT="
\$(_lastcommandfailed)\
$(_fg $GREEN)\w\
$(_fg $GRAY)\$(__git_ps1)\
\$(_backgroundjobs)\
$(_clr)"

export PS1="${BASEPROMPT}
$ "
