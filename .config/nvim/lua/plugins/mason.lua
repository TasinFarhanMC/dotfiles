return {
  {
    "williamboman/mason-lspconfig.nvim",
    event = "VeryLazy",
    opts = {
      ensure_installed = require("configs.lsps").ensure_install,
      automatic_enable = false,
    },
  },
  {
    "zapling/mason-conform.nvim",
    event = "VeryLazy",
    opts = {
      ignore_install = require("configs.conform").ignore_install,
    },
  },
}
