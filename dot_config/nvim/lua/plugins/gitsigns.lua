-- Show git diff markers in the sign column
return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    signs = {
      add = { text = "│" },
      change = { text = "│" },
      delete = { text = "_" },
      topdelete = { text = "‾" },
      changedelete = { text = "~" },
    },
    -- Prevent error when barbar closes a buffer before gitsigns detaches
    on_attach = function(bufnr)
      vim.api.nvim_create_autocmd("BufDelete", {
        buffer = bufnr,
        callback = function()
          pcall(require("gitsigns").detach, bufnr)
        end,
      })
    end,
  },
}
