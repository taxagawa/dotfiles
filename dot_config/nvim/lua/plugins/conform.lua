return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  keys = {
    { "<leader>cf", function() require("conform").format({ async = true }) end, desc = "Format buffer" },
  },
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      go = { "goimports", "gofmt" },
      python = { "ruff_format" },
      javascript = { "prettier" },
      typescript = { "prettier" },
      javascriptreact = { "prettier" },
      typescriptreact = { "prettier" },
      json = { "prettier" },
      yaml = { "prettier" },
      terraform = { "terraform_fmt" },
      sh = { "shfmt" },
      bash = { "shfmt" },
      zsh = { "shfmt" },
    },
    format_on_save = {
      timeout_ms = 3000,
      lsp_format = "fallback",
    },
  },
}
