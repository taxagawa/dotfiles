# dotfiles

Personal dotfiles managed with [chezmoi](https://www.chezmoi.io/).

## Setup on a new machine

```bash
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply taxagawa
```

This will:
1. Install Homebrew (if not present)
2. Install packages from Brewfile (CLI tools, GUI apps, Mac App Store apps)
3. Install Claude Code CLI
4. Deploy all configuration files

## Post-setup

### Font

This setup uses [Powerlevel10k](https://github.com/romkatv/powerlevel10k) with `nerdfont-v3` mode.
Install **MesloLGS NF** and set it as your terminal font:

- Download from [powerlevel10k font instructions](https://github.com/romkatv/powerlevel10k#meslo-nerd-font-patched-for-powerlevel10k)
- iTerm2: Preferences → Profiles → Text → Font → **MesloLGS NF**

### Other

```bash
# Install runtime versions managed by mise
mise install

# Configure powerlevel10k prompt
p10k configure

# Open a new shell to activate all settings
exec zsh
```

## Manual migration (from old machine)

These are NOT managed by chezmoi and must be copied manually:

- `~/.ssh/` — SSH keys (or regenerate on the new machine)
- `~/.aws/` — AWS credentials
- `~/Documents/`, `~/Pictures/`, etc. — Personal files

> **Note:** `mas` (Mac App Store) requires signing in to the App Store before running `chezmoi apply`.

## Usage

```bash
chezmoi diff      # Preview changes
chezmoi apply     # Apply changes
chezmoi edit      # Edit source files
chezmoi update    # Pull and apply latest changes
```

## Structure

| Path | Description |
|------|-------------|
| `dot_zshrc` | Zsh entry point (module loader) |
| `dot_zsh/` | Zsh modules (abbreviations, history, completion, direnv, etc.) |
| `dot_config/nvim/` | Neovim configuration (lazy.nvim + plugins) |
| `dot_config/mise/` | mise runtime version manager config |
| `dot_gitconfig.tmpl` | Git configuration (chezmoi template) |
| `dot_gitignore_global` | Global gitignore |
| `dot_tmux.conf` | tmux configuration |
| `dot_p10k.zsh` | Powerlevel10k prompt config |
| `Brewfile` | Homebrew packages (CLI, GUI, Mac App Store) |
| `.git-hooks/` | Git hooks (gitleaks pre-commit) |
| `.github/workflows/` | CI (chezmoi apply test on macOS) |
| `run_onchange_*.sh.tmpl` | chezmoi scripts (package install, git hooks setup) |
| `run_once_*.sh` | One-time setup scripts (Claude Code CLI) |
| `CLAUDE.md` | Claude Code project instructions |

## Runtime version management

Managed by [mise](https://mise.jdx.dev/) (replaces nodebrew, pyenv, etc.):

- Go
- Node.js
- Python
- Terraform
- uv (Python package manager)

Per-project versions can be set with `.mise.toml` or `.tool-versions`.
