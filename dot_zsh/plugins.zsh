# Plugins (zplug)
if [[ -f ~/.zplug/init.zsh ]]; then
  source ~/.zplug/init.zsh

  zplug 'zplug/zplug', hook-build:'zplug --self-manage'
  zplug 'romkatv/powerlevel10k', as:theme, depth:1        # Feature-rich prompt theme
  zplug 'zsh-users/zsh-autosuggestions'                    # Fish-like command suggestions
  zplug 'zsh-users/zsh-syntax-highlighting', defer:2       # Command syntax highlighting
  zplug 'zsh-users/zsh-completions'                        # Additional completion definitions
  zplug 'olets/zsh-abbr', defer:3                            # Expandable abbreviations (replaces aliases)

  if ! zplug check; then
    zplug install
  fi

  zplug load
fi
