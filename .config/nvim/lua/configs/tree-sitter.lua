require("nvim-treesitter.configs").setup {
  ensure_installed = {
    "luadoc",
    "markdown",
    "vim",
    "vimdoc",
    "json",
    "yaml",
    "toml",
    "bash",
    "lua",
    "c",
    "cpp",
    "python",
    "typescript",
    "javascript",
    "scss",
    "svelte",
  },

  highlight = {
    enable = true,
    use_languagetree = true,
  },

  indent = { enable = true },
}
