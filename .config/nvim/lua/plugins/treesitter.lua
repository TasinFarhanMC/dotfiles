return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  build = ":TSUpdate",

  config = function()
    local ts = require "nvim-treesitter"

    ts.install({
      "vim",
      "lua",
      "vimdoc",
      "html",
      "css",
      "javascript",
      "typescript",
      "c",
      "cpp",
      "bash",
      "cmake",
      "yaml",
      "json",
      "toml",
    }, {
      force = false,
      summary = false,
    })
  end,
}
