# dotfiles

Personal dotfiles managed with [chezmoi](https://www.chezmoi.io/).

## Setup on a new machine

```bash
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply taxagawa
```

This will:
1. Install Homebrew (if not present)
2. Install packages from Brewfile (CLI tools, GUI apps, Mac App Store apps)
3. Install zplug (zsh plugin manager)
4. Install Claude Code CLI
5. Install runtime versions via mise (if mise is available)
6. Deploy all configuration files

## Post-setup

### Font

This setup uses [Powerlevel10k](https://github.com/romkatv/powerlevel10k) with `nerdfont-v3` mode.
Install **MesloLGS NF** and set it as your terminal font:

- Download from [powerlevel10k font instructions](https://github.com/romkatv/powerlevel10k#meslo-nerd-font-patched-for-powerlevel10k)
- iTerm2: Preferences → Profiles → Text → Font → **MesloLGS NF**

### iTerm2 Color Scheme

Install [Tokyo Night](https://github.com/enkia/tokyo-night-vscode-theme) color scheme to match the Neovim theme:

```bash
curl -sL "https://raw.githubusercontent.com/enkia/tokyo-night-vscode-theme/master/tokyo-night.itermcolors" -o /tmp/tokyo-night.itermcolors
open /tmp/tokyo-night.itermcolors
```

Then apply: iTerm2 → Preferences → Profiles → Colors → Color Presets → **tokyo-night**

### Shell

Set Homebrew-installed zsh as default shell:

```bash
# Add Homebrew zsh to allowed shells
echo /opt/homebrew/bin/zsh | sudo tee -a /etc/shells

# Set as default shell
chsh -s /opt/homebrew/bin/zsh
```

### Karabiner-Elements

If using a different keyboard, update `product_id` and `vendor_id` in `dot_config/karabiner/karabiner.json` to match the new device. Key remapping rules (Ctrl+hjkl, CapsLock→Ctrl) work regardless of these IDs.

### Other

```bash
# Install runtime versions managed by mise
mise install

# Reconfigure powerlevel10k prompt (optional, config is already deployed)
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
| `dot_zshrc` | Zsh entry point (instant prompt + module loader) |
| `dot_zsh/` | Zsh modules (abbreviations, history, completion, direnv, etc.) |
| `dot_config/nvim/` | Neovim configuration (lazy.nvim + plugins) |
| `dot_config/gh/` | GitHub CLI config (protocol, editor, aliases) |
| `dot_config/karabiner/` | Karabiner-Elements config (key remapping) |
| `dot_config/mise/` | mise runtime version manager config |
| `dot_gitconfig.tmpl` | Git configuration (chezmoi template) |
| `dot_gitignore_global` | Global gitignore |
| `dot_tmux.conf` | tmux configuration |
| `dot_p10k.zsh` | Powerlevel10k prompt config |
| `.chezmoitemplates/Brewfile` | Homebrew packages (personal flag controls app selection) |
| `.git-hooks/` | Git hooks (gitleaks pre-commit) |
| `.github/workflows/` | CI (chezmoi apply test on macOS) |
| `run_onchange_*.sh.tmpl` | chezmoi scripts (package install, git hooks setup) |
| `run_once_*.sh` | One-time setup scripts (zplug, Claude Code CLI) |
| `CLAUDE.md` | Claude Code project instructions |

## Runtime version management

Managed by [mise](https://mise.jdx.dev/) (replaces nodebrew, pyenv, etc.):

- Go
- Node.js
- Python
- Terraform
- uv (Python package manager)

Per-project versions can be set with `.mise.toml` or `.tool-versions`.
