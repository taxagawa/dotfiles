# Key bindings (Emacs style)
bindkey -e
bindkey '^A' beginning-of-line
bindkey '^E' end-of-line

# Menu selection with vim keys
zmodload zsh/complist
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
