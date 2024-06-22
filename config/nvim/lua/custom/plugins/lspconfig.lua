return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    { "antosha417/nvim-lsp-file-operations", config = true },
    { "folke/neodev.nvim",                   opts = {} },
  },
  config = function()
    local lspconfig = require "lspconfig"
    --local lsputil = lspconfig.util
    local mason_lspconfig = require "mason-lspconfig"
    local cmp_nvim_lsp = require "cmp_nvim_lsp"
    local keymap = vim.keymap

    local function on_attach(_, bufrn)
      local opts = { buffer = bufrn, silent = true }

      local function goto_dec()
        vim.cmd("vert botright split")
        vim.lsp.buf.declaration(opts)
      end

      keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts)
      keymap.set("n", "gD", goto_dec, opts)
      keymap.set("n", "gd", vim.lsp.buf.declaration, opts)
      keymap.set("n", "gI", "<cmd>vert botright split | Telescope lsp_implementations<CR>", opts)
      keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)
      keymap.set("n", "gT", "<cmd>vert botright split | Telescope lsp_type_definitions<CR>", opts)
      keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)
      keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
      keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
      keymap.set("n", "K", vim.lsp.buf.hover, opts)
    end

    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(ev)
        on_attach(ev.client, ev.buf)
      end
    })

    local capabilities = cmp_nvim_lsp.default_capabilities()
    capabilities.textDocument.completion.completionItem = {
      documentationFormat = { "markdown_inline", "plaintext" },
      snippetSupport = true,
      preselectSupport = true,
      insertReplaceSupport = true,
      deprecatedSupport = true,
      commitCharactersSupport = true,
      tagSupport = { valueSet = { 1 } },
      resolveSupport = {
        properties = {
          "documentation",
          "detail",
          "additionalTextEdits",
        },
      },
    }

    local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

    mason_lspconfig.setup_handlers({
      function(server_name)
        lspconfig[server_name].setup { capabilities = capabilities }
      end,
      ["clangd"] = function()
        lspconfig.clangd.setup {
          capabilities = capabilities,
          cmd = { "clangd", "--completion-style=detailed" }
        }
      end,
      ["lua_ls"] = function()
        lspconfig.lua_ls.setup({
          capabilities = capabilities,
          settings = {
            Lua = {
              diagnostics = {
                globals = { "vim" },
              },
              completion = {
                callSnippet = "Replace",
              },
            },
          },
        })
      end
    })

    require 'lspconfig'.rust_analyzer.setup {}
    require 'lspconfig'.zls.setup {}
  end
}
