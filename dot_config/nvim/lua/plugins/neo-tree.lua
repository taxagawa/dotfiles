-- File explorer sidebar (VSCode-like)
return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",          -- UI component library for the tree view
  },
  keys = {
    { "<leader>ee", "<cmd>Neotree toggle<CR>", desc = "Toggle file explorer" },
  },
  opts = {
    filesystem = {
      filtered_items = {
        visible = true,
        hide_dotfiles = false,
        hide_gitignored = true,
      },
    },
  },
}
