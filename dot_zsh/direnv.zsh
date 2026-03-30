# direnv - Automatically load/unload environment variables based on .envrc
if command -v direnv &>/dev/null; then
  eval "$(direnv hook zsh)"
fi
