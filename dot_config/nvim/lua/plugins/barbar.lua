-- Tab-like buffer line at the top
return {
  "romgrk/barbar.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "lewis6991/gitsigns.nvim",
  },
  event = "BufEnter",
  keys = {
    { "<S-h>", "<cmd>BufferPrevious<CR>", desc = "Previous buffer" },
    { "<S-l>", "<cmd>BufferNext<CR>", desc = "Next buffer" },
    { "<A-<>", "<cmd>BufferMovePrevious<CR>", desc = "Move buffer left" },
    { "<A->>", "<cmd>BufferMoveNext<CR>", desc = "Move buffer right" },
    { "<leader>bd", "<cmd>BufferClose<CR>", desc = "Close buffer" },
    { "<leader>bp", "<cmd>BufferPin<CR>", desc = "Pin buffer" },
    { "<leader>bo", "<cmd>BufferCloseAllButCurrentOrPinned<CR>", desc = "Close other buffers" },
  },
  opts = {
    animation = false,
    auto_hide = 1,
    icons = {
      diagnostics = {
        [vim.diagnostic.severity.ERROR] = { enabled = true },
        [vim.diagnostic.severity.WARN] = { enabled = true },
      },
      gitsigns = {
        added = { enabled = true, icon = "+" },
        changed = { enabled = true, icon = "~" },
        deleted = { enabled = true, icon = "-" },
      },
      pinned = { button = "", filename = true },
    },
  },
}
