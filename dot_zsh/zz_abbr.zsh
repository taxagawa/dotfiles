# Abbreviations (zsh-abbr)
# Expanded inline before execution so history stays accurate
# Prefixed with "zz_" to ensure loading after plugins.zsh (which provides the abbr function)
if (( $+functions[abbr] )); then

  # Git
  abbr -S -q g='git'

  # Neovim
  abbr -S -q v='nvim'
  abbr -S -q vi='nvim'
  abbr -S -q vim='nvim'

  # Chezmoi
  abbr -S -q cz='chezmoi'
  abbr -S -q czd='chezmoi diff'
  abbr -S -q cza='chezmoi apply'

  # Navigation
  abbr -S -q ..='cd ..'
  abbr -S -q ...='cd ../..'

  # Safety nets (prompt before overwrite/delete)
  abbr -f -S -qq cp='cp -i'
  abbr -f -S -qq mv='mv -i'
  abbr -f -S -qq rm='rm -i'

  # ls (eza)
  abbr -f -S -qq ls='eza'
  abbr -S -q ll='eza -lh'
  abbr -S -q la='eza -a'
  abbr -S -q lla='eza -lah'
  abbr -S -q lt='eza --tree'

fi
