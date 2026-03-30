#!/bin/bash
# Install or update Claude Code CLI
set -euo pipefail

if ! command -v claude &>/dev/null; then
  curl -fsSL https://claude.ai/install.sh | sh
fi
