# fzf
if command -v fzf &>/dev/null; then
  source <(fzf --zsh)

  export FZF_DEFAULT_OPTS='--height 40% --reverse --border'
  export FZF_CTRL_R_OPTS='--sort'

  # Rebind Alt+C (fzf-cd-widget) to Ctrl+G for macOS compatibility
  bindkey -r '\ec'
  bindkey '^G' fzf-cd-widget

  # ghq + fzf: repository search
  function ghq-fzf() {
    local root=$(ghq root)
    local repo=$(ghq list | fzf --preview "ls -la ${root}/{}")
    if [[ -n "$repo" ]]; then
      cd "${root}/${repo}"
    fi
  }
  alias gf=ghq-fzf
fi
