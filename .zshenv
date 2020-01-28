# Debugging
if [[ -e ~/.debug_dotfiles ]]; then
  echo -n "${(%):-%N} "
  id -un
fi
