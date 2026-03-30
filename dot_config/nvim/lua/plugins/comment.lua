-- Toggle comments (auto-detects language-appropriate comment syntax)
return {
  "numToStr/Comment.nvim",
  keys = {
    { "gcc", mode = "n", desc = "Toggle line comment" },
    { "gc", mode = "v", desc = "Toggle comment for selection" },
  },
  opts = {},
}
