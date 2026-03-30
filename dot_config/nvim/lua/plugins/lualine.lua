-- Status line showing mode, git branch, diagnostics, cursor position
return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  event = "VeryLazy",
  opts = {
    options = {
      theme = "tokyonight",
    },
  },
}
