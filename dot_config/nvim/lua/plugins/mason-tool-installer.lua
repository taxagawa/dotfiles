return {
  "WhoIsSethDaniel/mason-tool-installer.nvim",
  dependencies = { "williamboman/mason.nvim" },
  opts = {
    ensure_installed = {
      -- Formatters
      "stylua",
      "goimports",
      "prettier",
      "shfmt",
      -- Linters
      "golangci-lint",
      "ruff",
      "eslint_d",
      "shellcheck",
    },
  },
}
