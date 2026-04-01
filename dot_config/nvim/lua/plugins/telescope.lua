return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    -- Native C port of fzf for faster matching
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  },
  keys = {
    { "<leader>ff", "<cmd>Telescope find_files<CR>", desc = "Find files" },
    { "<leader>fg", "<cmd>Telescope live_grep<CR>", desc = "Live grep" },
    { "<leader>fb", "<cmd>Telescope buffers<CR>", desc = "Find buffers" },
    { "<leader>fh", "<cmd>Telescope help_tags<CR>", desc = "Help tags" },
    { "<leader>fr", "<cmd>Telescope oldfiles<CR>", desc = "Recent files" },
  },
  config = function()
    require("telescope").setup({
      defaults = {
        file_ignore_patterns = { "%.git/" },
      },
      pickers = {
        find_files = { hidden = true },
        live_grep = {
          additional_args = { "--hidden" },
        },
      },
    })
    require("telescope").load_extension("fzf")
  end,
}
