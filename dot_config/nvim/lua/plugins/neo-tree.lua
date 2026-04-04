-- File explorer sidebar (VSCode-like)
return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",          -- UI component library for the tree view
    "s1n7ax/nvim-window-picker",
  },
  keys = {
    { "<leader>ee", "<cmd>Neotree toggle<CR>", desc = "Toggle file explorer" },
    { "<leader>er", "<cmd>Neotree reveal<CR>", desc = "Reveal current file in explorer" },
    { "<leader>eb", "<cmd>Neotree float buffers<CR>", desc = "Show open buffers in explorer" },
  },
  opts = {
    filesystem = {
      follow_current_file = { enabled = true },
      filtered_items = {
        visible = true,
        hide_dotfiles = false,
        hide_gitignored = false,
      },
    },
  },
}
