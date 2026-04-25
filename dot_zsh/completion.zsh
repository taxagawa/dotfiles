# Completion

# Regenerate compdump only once every 24 hours for faster startup
# Run full compinit when dump file is missing (new machine) or stale (>24h)
autoload -Uz compinit
if [[ ! -f ~/.zcompdump ]] || [[ -n ~/.zcompdump(#qN.mh+24) ]]; then
  compinit
else
  compinit -C
fi

# Highlight current selection in completion menu
zstyle ':completion:*:default' menu select=1

# Case-insensitive matching (lowercase matches uppercase)
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# Colorize completion candidates
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# Group completion results by category
zstyle ':completion:*' group-name ''
zstyle ':completion:*' format '%B%d%b'
