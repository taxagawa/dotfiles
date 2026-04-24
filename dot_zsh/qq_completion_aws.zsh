# AWS CLI command completion
# Prefixed with "qq_" to ensure loading after plugins.zsh (which runs compinit)
if command -v aws_completer &>/dev/null; then
  autoload -Uz bashcompinit && bashcompinit
  complete -C aws_completer aws
fi
