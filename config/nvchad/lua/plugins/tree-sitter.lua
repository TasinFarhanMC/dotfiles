return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require "configs.tree-sitter"
  end,
}
