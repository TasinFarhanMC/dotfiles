local options = {
  formatters_by_ft = {
    html = { "prettier" },
    lua = { "stylua" },
    python = { "ruff_format" },
    sh = { "shfmt" },
    bash = { "shfmt" },
    zsh = { "shfmt" },
    asm = { "asmfmt" },
    css = { "prettier" },
    scss = { "prettier" },
    js = { "prettier" },
    ts = { "prettier" },
    cmake = { "cmake_format" },
  },

  ignore_install = {},

  format_on_save = {
    lsp_fallback = true,
    timeout_ms = 500,
  },
}

return options
