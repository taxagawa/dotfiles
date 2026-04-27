return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    spec = {
      { "<leader>f", group = "Find" },
      { "<leader>e", group = "Explorer" },
      { "<leader>b", group = "Buffer" },
      { "<leader>c", group = "Code" },
      { "<leader>r", group = "Refactor" },
      { "<leader>m", group = "Markdown" },
    },
  },
}
