# Completion styles (compinit is called in plugins.zsh after zplug load)

# Highlight current selection in completion menu
zstyle ':completion:*:default' menu select=1

# Case-insensitive matching (lowercase matches uppercase)
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# Colorize completion candidates
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# Group completion results by category
zstyle ':completion:*' group-name ''
zstyle ':completion:*' format '%B%d%b'
