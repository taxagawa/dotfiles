# mise - Runtime version manager (replaces nodebrew, pyenv, etc.)
# Check common install locations since PATH may not be set yet
local mise_cmd="${commands[mise]:-${HOME}/.local/bin/mise}"
if [[ -x "$mise_cmd" ]]; then
  eval "$("$mise_cmd" activate zsh)"
fi
