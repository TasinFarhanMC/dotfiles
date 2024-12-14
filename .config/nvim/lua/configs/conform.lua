return {
  formatters_by_ft = {
    lua = { "stylua" },
    python = { "ruff_format" },
    sh = { "shfmt" },
    bash = { "shfmt" },
    zsh = { "shfmt" },
  },

  default_format_opts = { lsp_format = "fallback" },
  format_on_save = { timeout_ms = 500 },
}

--vim.api.nvim_create_autocmd("BufWritePre", {
--  pattern = "*",
--  callback = function()
--    conform.format()
--  end,
--})
