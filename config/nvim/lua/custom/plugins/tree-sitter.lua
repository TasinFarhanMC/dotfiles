return {
  "nvim-treesitter/nvim-treesitter",
  name = "treesitter",
  config = function()
    require("nvim-treesitter.configs").setup {
      highlight = { enable = true },
      incremental_selection = { enable = true },
      indent = { enable = true },
      sync_install = false,
      ensure_installed = {
        "c",
        "cpp",
        "python",
        "bash",
        "rust",
        "zig"
      }
    }
  end,

  build = function()
    require("nvim-treesitter.install").update({ with_sync = true })()
  end
}
