-- Set leader key before loading plugins
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Compatibility shim for Neovim 0.12+ (ft_to_lang was replaced by get_lang)
if vim.treesitter.language.get_lang and not vim.treesitter.language.ft_to_lang then
  vim.treesitter.language.ft_to_lang = vim.treesitter.language.get_lang
end

-- Load configuration modules
require("config.options")
require("config.keymaps")
require("config.lazy")
