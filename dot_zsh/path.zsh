# PATH
typeset -U path

path=(
  /opt/homebrew/bin    # Homebrew (Apple Silicon)
  /usr/local/bin       # Homebrew (Intel)
  $HOME/.local/bin     # mise, etc.
  $HOME/.cargo/bin     # Rust (cargo install)
  $path
)

export PATH
