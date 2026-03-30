-- Basic options
vim.opt.number = true
vim.opt.relativenumber = true       -- Show relative line numbers for easier j/k jumps
vim.opt.cursorline = true
vim.opt.signcolumn = "yes"          -- Always show sign column to prevent layout shift
vim.opt.termguicolors = true        -- Required for modern color schemes

-- Indentation
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.smartindent = true

-- Search
vim.opt.ignorecase = true
vim.opt.smartcase = true            -- Case-sensitive only when pattern has uppercase
vim.opt.hlsearch = true
vim.opt.incsearch = true

-- Persist undo history across sessions
vim.opt.undofile = true

-- Keep cursor away from screen edge while scrolling
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8

-- Open new splits in a natural direction
vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.clipboard = "unnamedplus"   -- Use system clipboard
vim.opt.swapfile = false            -- Disabled since undofile covers recovery
vim.opt.updatetime = 250            -- Faster CursorHold events (default: 4000ms)

-- Show invisible characters
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

vim.opt.wrap = false

-- Highlight full-width spaces (U+3000)
vim.api.nvim_create_autocmd("BufEnter", {
  callback = function()
    vim.fn.matchadd("Error", "　")
  end,
})
