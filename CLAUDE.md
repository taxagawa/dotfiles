# CLAUDE.md

## IMPORTANT

- **ALWAYS** update relevant README files (`README.md`, `dot_config/nvim/README.md`) when changes affect documented content (keymaps, structure, setup instructions, Brewfile, etc.). Do this in the SAME operation as the code change, not as a separate step.
- This is a public repository — **NEVER** commit credentials, secrets, or personal information.

## Project Overview

Personal dotfiles managed with [chezmoi](https://www.chezmoi.io/).

## Directory Structure

```
.
├── .chezmoi.yaml.tmpl              # chezmoi config template (prompts for name/email)
├── .chezmoiignore                  # Files excluded from home directory deployment
├── .git-hooks/                     # Git hooks (copied to .git/hooks/ by chezmoi)
├── .github/workflows/              # CI (chezmoi apply test)
├── .chezmoitemplates/Brewfile       # Homebrew packages (chezmoi template, personal flag)
├── dot_zshrc                       # → ~/.zshrc (entry point)
├── dot_zsh/                        # → ~/.zsh/ (modular zsh config)
│   ├── chezmoi.zsh                 # Drift detection (once per day)
│   ├── completion.zsh              # Completion (compinit + styles)
│   ├── direnv.zsh                  # direnv hook for .envrc support
│   ├── fzf.zsh
│   ├── history.zsh
│   ├── keybinds.zsh
│   ├── mise.zsh
│   ├── options.zsh
│   ├── path.zsh
│   ├── plugins.zsh                # zplug + powerlevel10k
│   ├── qq_completion_aws.zsh      # AWS CLI completion (loads after plugins.zsh)
│   └── zz_abbr.zsh                # Expandable abbreviations (loads after plugins.zsh)
├── dot_config/
│   ├── mise/config.toml            # → ~/.config/mise/config.toml
│   └── nvim/                       # → ~/.config/nvim/
│       ├── init.lua
│       ├── README.md               # Keymaps and vim motions reference
│       └── lua/
│           ├── config/             # Core config (options, keymaps, lazy.nvim)
│           └── plugins/            # One file per plugin
├── dot_gitconfig.tmpl              # → ~/.gitconfig (chezmoi template)
├── dot_gitignore_global            # → ~/.gitignore_global
├── dot_p10k.zsh                    # → ~/.p10k.zsh (powerlevel10k config)
├── dot_tmux.conf                   # → ~/.tmux.conf
├── run_onchange_01-install-packages.sh.tmpl
├── run_onchange_02-setup-git-hooks.sh.tmpl
└── run_once_03-install-claude-code.sh
```

## Conventions

- Comments in config files should be written in English
- All responses to the user should be in Japanese (日本語)
- One tool/concern per file (e.g., `dot_zsh/fzf.zsh`, `dot_zsh/mise.zsh`)
- Neovim plugins are split into individual files under `dot_config/nvim/lua/plugins/`
- chezmoi scripts use numbered prefixes for execution order (e.g., `01-install-packages`, `02-setup-git-hooks`)

## Key Commands

- `chezmoi diff` — Preview changes before applying
- `chezmoi apply --force` — Apply all changes to home directory
- `chezmoi add <file>` — Add a home directory file to chezmoi management

## Security

- gitleaks pre-commit hook is configured in `.git-hooks/`
- Secrets must use chezmoi templates (`{{ .variable }}`) defined in `.chezmoi.yaml.tmpl`
- `.gitignore` blocks common secret file patterns (`.env`, `*.pem`, etc.)
