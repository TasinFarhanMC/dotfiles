return {
  "jose-elias-alvarez/null-ls.nvim",
  event = { "BufReadPre", "BufNewFile" },

  config = function()
    local status, null_ls = pcall(require, "null-ls")
    if not status then
      return
    end

    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.autopep8
      },
    })

    vim.cmd [[
      command! NullLsFormat lua vim.lsp.buf.format({ async = true, name = 'null-ls' })
    ]]

    function _G.format_or_null_ls()
      local clients = vim.lsp.get_active_clients()
      local has_lsp_formatting = false

      for _, client in ipairs(clients) do
        if client.server_capabilities.documentFormattingProvider then
          has_lsp_formatting = true
          break
        end
      end

      if has_lsp_formatting then
        vim.lsp.buf.format({ async = true })
      else
        vim.cmd('NullLsFormat')
      end
    end

    vim.api.nvim_set_keymap('n', 'E', '<cmd>lua format_or_null_ls()<CR>', { noremap = true, silent = true })
  end
}
