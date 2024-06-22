local lang = require "custom/lang"

return {
  "williamboman/mason.nvim",

  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },

  config = function()
    local mason = require "mason"
    local mason_lspconfig = require "mason-lspconfig"
    local mason_tool_installer = require "mason-tool-installer"

    mason.setup {
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    }

    mason_tool_installer.setup {
      ensure_installed = lang.tools,
      automatic_installation = true
    }

    mason_lspconfig.setup {
    --  ensure_installed = lang.lsp,
      --automatic_installation = true
    }
  end
}
