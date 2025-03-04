local lint = require "lint"

lint.linters_by_ft = {
  lua = { "luacheck" },
  python = { "ruff" },
  sh = { "shellcheck" },
  bash = { "shellcheck" },
  zsh = { "shellcheck" },
  typescript = { "eslint_d" },
  javascript = { "eslint_d" },
  html = { "htmlhint" },
  css = { "stylelint" },
  scss = { "stylelint" },
}

lint.linters.luacheck.args = {
  "--globals",
  "love",
  "vim",
  "--formatter",
  "plain",
  "--codes",
  "--ranges",
  "-",
}

vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
  callback = function()
    lint.try_lint()
  end,
})
