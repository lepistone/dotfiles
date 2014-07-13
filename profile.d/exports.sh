export LESS=-FXRSq

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

if [ "$(uname)" == "Linux" ]; then
        export TERM=xterm-256color
fi
