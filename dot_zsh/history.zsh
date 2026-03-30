# History
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000

setopt extended_history          # Record timestamp and duration
setopt hist_ignore_all_dups      # Remove older duplicate entries
setopt hist_ignore_space         # Ignore commands starting with a space
setopt hist_reduce_blanks        # Remove extra whitespace
setopt hist_verify               # Show expanded history before executing
setopt hist_expire_dups_first    # Expire duplicates first when trimming history
setopt share_history             # Share history across all sessions
