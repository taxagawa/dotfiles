# AWS CLI command completion
# Named "completion_aws" to ensure loading after completion.zsh (which provides compinit/compdef)
if command -v aws_completer &>/dev/null; then
  autoload -Uz bashcompinit && bashcompinit
  complete -C aws_completer aws
fi
