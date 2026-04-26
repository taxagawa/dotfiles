#!/bin/bash
# Install zplug (zsh plugin manager)
set -euo pipefail

if [[ ! -d ~/.zplug ]]; then
  curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/zplug/master/installer.zsh | zsh
fi
