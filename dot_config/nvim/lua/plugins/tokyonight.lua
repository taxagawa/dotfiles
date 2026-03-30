return {
  "folke/tokyonight.nvim",
  lazy = false,        -- Load immediately (color scheme must be available at startup)
  priority = 1000,     -- Load before other plugins to avoid flash of default colors
  config = function()
    vim.cmd.colorscheme("tokyonight")
  end,
}
