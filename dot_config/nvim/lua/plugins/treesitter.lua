-- AST-based syntax highlighting (more accurate than regex-based)
return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" },
  config = function()
    require("nvim-treesitter").setup()

    -- Auto-install parsers for these languages
    local ensure = {
      "bash", "json", "lua", "markdown", "markdown_inline",
      "python", "go", "javascript", "typescript", "yaml", "toml",
    }
    for _, lang in ipairs(ensure) do
      pcall(function() vim.treesitter.language.add(lang) end)
    end
  end,
}
