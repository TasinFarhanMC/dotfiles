local conform = require "conform"

conform.formatters_by_ft = {
  lua = { "stylua" },
  c = { "clang-format" },
  cpp = { "clang-format" },
}

conform.format_on_save = {
  timeout_ms = 500,
  lsp_fallback = true,
}

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function()
    conform.format()
  end,
})
