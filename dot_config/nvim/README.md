# Neovim Configuration

## Structure

```
nvim/
├── init.lua                  # Entry point: leader key + module loading
└── lua/
    ├── config/
    │   ├── options.lua       # Editor options (line numbers, search, undo, etc.)
    │   ├── keymaps.lua       # Custom key mappings
    │   └── lazy.lua          # lazy.nvim plugin manager bootstrap
    └── plugins/
        ├── telescope.lua     # Fuzzy finder (files, grep, buffers)
        ├── treesitter.lua    # Syntax highlighting via AST parsing
        ├── lspconfig.lua     # Language Server Protocol (completion, go-to-definition)
        ├── cmp.lua           # Auto-completion engine
        ├── lualine.lua       # Status line
        ├── neo-tree.lua      # File explorer sidebar
        ├── tokyonight.lua    # Color scheme
        ├── autopairs.lua     # Auto-close brackets and quotes
        ├── barbar.lua        # Tab-like buffer line
        ├── gitsigns.lua      # Git change indicators in the gutter
        ├── window-picker.lua # Window picker for neo-tree
        ├── comment.lua       # Toggle comments
        ├── markdown-preview.lua  # Live markdown preview in browser
        ├── conform.lua       # Auto-formatting on save
        ├── lint.lua          # Linting on save
        ├── mason-tool-installer.lua  # Auto-install formatters/linters via Mason
        └── which-key.lua     # Keymap popup guide
```

## Keymaps

Leader key: `Space`

### General

| Key | Mode | Action |
|-----|------|--------|
| `Space w` | Normal | Save file |
| `Space q` | Normal | Quit |
| `Esc` | Normal | Clear search highlight |

### Navigation

| Key | Mode | Action |
|-----|------|--------|
| `Ctrl+h/j/k/l` | Normal | Move between windows |
| `Delete` | Normal | Move to left window (Karabiner C-h workaround) |
| `Shift+h` | Normal | Previous buffer (tab) |
| `Shift+l` | Normal | Next buffer (tab) |
| `Alt+<` | Normal | Move buffer left |
| `Alt+>` | Normal | Move buffer right |
| `Space bd` | Normal | Close current buffer |
| `Space bp` | Normal | Pin buffer |
| `Space bo` | Normal | Close other buffers |
| `Ctrl+d` | Normal | Scroll down (centered) |
| `Ctrl+u` | Normal | Scroll up (centered) |

### Window Management

| Key | Mode | Action |
|-----|------|--------|
| `Ctrl+Up/Down` | Normal | Resize window height |
| `Ctrl+Left/Right` | Normal | Resize window width |

### Editing

| Key | Mode | Action |
|-----|------|--------|
| `J` | Visual | Move selected lines down |
| `K` | Visual | Move selected lines up |
| `<` | Visual | Unindent (stay in visual mode) |
| `>` | Visual | Indent (stay in visual mode) |
| `gcc` | Normal | Toggle line comment |
| `gc` | Visual | Toggle comment for selection |

### Markdown Preview

| Key | Mode | Action |
|-----|------|--------|
| `Space mp` | Normal | Toggle Markdown preview in browser |

### File Explorer (Neo-tree)

| Key | Mode | Action |
|-----|------|--------|
| `Space ee` | Normal | Toggle file explorer |
| `Space er` | Normal | Reveal current file in explorer |
| `Space eb` | Normal | Show open buffers in explorer |

### Telescope (Fuzzy Finder)

| Key | Mode | Action |
|-----|------|--------|
| `Space ff` | Normal | Find files |
| `Space fg` | Normal | Live grep (search text across files) |
| `Space fb` | Normal | List open buffers |
| `Space fh` | Normal | Search help tags |
| `Space fr` | Normal | Recent files |
| `Space fk` | Normal | Search keymaps |

### LSP (Language Server)

Available when a language server is attached to the buffer:

| Key | Mode | Action |
|-----|------|--------|
| `gd` | Normal | Go to definition |
| `gr` | Normal | Go to references |
| `K` | Normal | Hover documentation |
| `Space rn` | Normal | Rename symbol |
| `Space ca` | Normal | Code action |
| `Space cf` | Normal | Format buffer |

### Auto-completion (nvim-cmp)

| Key | Mode | Action |
|-----|------|--------|
| `Ctrl+n` | Insert | Next completion item |
| `Ctrl+p` | Insert | Previous completion item |
| `Ctrl+d` | Insert | Scroll docs down |
| `Ctrl+u` | Insert | Scroll docs up |
| `Enter` | Insert | Confirm selection |
| `Ctrl+Space` | Insert | Trigger completion manually |

## Essential Vim Motions

### Modes

| Key | Action |
|-----|--------|
| `i` | Enter Insert mode (before cursor) |
| `a` | Enter Insert mode (after cursor) |
| `v` | Enter Visual mode (character) |
| `V` | Enter Visual mode (line) |
| `Esc` / `Ctrl+[` | Return to Normal mode |

### Movement

| Key | Action |
|-----|--------|
| `h/j/k/l` | Left / Down / Up / Right |
| `w` | Next word |
| `b` | Previous word |
| `0` | Start of line |
| `$` | End of line |
| `gg` | Start of file |
| `G` | End of file |
| `{` / `}` | Previous / Next paragraph |
| `%` | Jump to matching bracket |
| `f{char}` | Jump to next {char} on current line |

### Editing

| Key | Action |
|-----|--------|
| `x` | Delete character |
| `dd` | Delete line |
| `yy` | Yank (copy) line |
| `p` | Paste after cursor |
| `P` | Paste before cursor |
| `u` | Undo |
| `Ctrl+r` | Redo |
| `ciw` | Change inner word |
| `ci"` | Change inside quotes |
| `di(` | Delete inside parentheses |
| `.` | Repeat last change |

### Search

| Key | Action |
|-----|--------|
| `/pattern` | Search forward |
| `?pattern` | Search backward |
| `n` | Next match |
| `N` | Previous match |
| `*` | Search word under cursor |

### Splits

| Key | Action |
|-----|--------|
| `:vs` | Vertical split |
| `:sp` | Horizontal split |

## Plugin Updates

Plugin updates are checked automatically and shown in the statusline.
To apply updates, run `:Lazy update`.

## Formatters & Linters

Auto-format on save is enabled via `conform.nvim`. Linting runs on save via `nvim-lint`.

| Language | Formatter | Linter |
|----------|-----------|--------|
| Lua | stylua | — |
| Go | goimports, gofmt | golangci-lint |
| Python | ruff | ruff |
| TypeScript/JS | prettier | eslint_d |
| Terraform | terraform_fmt | tflint (LSP) |
| JSON/YAML | prettier | — |
| Shell | shfmt | shellcheck |

## Adding a New Language Server

Currently configured: `lua_ls`, `gopls`, `ts_ls`, `pyright`, `terraformls`, `tflint`, `jsonls`, `yamlls`, `taplo`, `dockerls`, `docker_compose_language_service`, `bashls`

To add a new language server:

1. Open Neovim and run `:Mason` to see available servers
2. Install the server (e.g., `:MasonInstall rust_analyzer`)
3. Add the server config and enable it in `lua/plugins/lspconfig.lua`:
   ```lua
   vim.lsp.config("rust_analyzer", { capabilities = capabilities })
   vim.lsp.enable("rust_analyzer")
   ```
4. Add the server name to the `ensure_installed` list for automatic installation
