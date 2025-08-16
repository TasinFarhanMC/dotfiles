local servers = {
  lua_ls = {
    settings = {
      Lua = {
        diagnostics = {
          enable = false,
          globals = { "vim" },
        },
        workspace = {
          library = {
            vim.fn.expand "$VIMRUNTIME/lua",
            vim.fn.expand "$VIMRUNTIME/lua/vim/lsp",
            vim.fn.stdpath "data" .. "/lazy/ui/nvchad_types",
            vim.fn.stdpath "data" .. "/lazy/lazy.nvim/lua/lazy",
            "${3rd}/love2d/library",
          },
          maxPreload = 100000,
          preloadFileSize = 10000,
        },
      },
    },
  },

  clangd = {},

  astro = {},
  pyright = {},
  cmake = {},
  bashls = {},
  svelte = {},
  ts_ls = {},
  html = {},
  rust_analyzer = {},
  arduino_language_server = {},
  -- "asm_lsp",
  -- "eslint",
  -- "java_language_server",
  -- "kotlin_language_server",
}

local ignore_install = {
  "clangd",
  "rust_analyzer",
  "arduino_language_server",
}

local function subtract_tables(a, b)
  local b_set = {}
  for _, v in ipairs(b) do
    b_set[v] = true
  end

  local result = {}
  for k, _ in pairs(a) do
    if not b_set[k] then
      table.insert(result, k)
    end
  end
  return result
end

return {
  servers = servers,
  ignore_install = ignore_install,
  ensure_install = subtract_tables(servers, ignore_install),
}
