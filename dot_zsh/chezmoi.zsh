# Chezmoi drift check (once per day)
if command -v chezmoi &>/dev/null; then
  local stamp_file="${XDG_CACHE_HOME:-$HOME/.cache}/chezmoi-drift-check"
  if [[ ! -f "$stamp_file" || -n "$stamp_file"(#qN.mh+24) ]]; then
    if ! chezmoi verify > /dev/null 2>&1; then
      print -P "%F{yellow}[chezmoi]%f Local files have drifted from source. Run 'chezmoi diff' to review."
    fi
    mkdir -p "${stamp_file:h}"
    touch "$stamp_file"
  fi
fi
