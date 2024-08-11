return {
  "nvim-tree/nvim-tree.lua",
  name = "tree",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    name = "web-devicons",
    lazy = true
  },
  config = function()
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    local tree = require "nvim-tree"
    tree.setup {}

    local keymap = vim.keymap
    keymap.set('n', "<leader>d", ":NvimTreeFocus<CR>", { noremap = true, silent = true })
    keymap.set('n', "<leader>D", ":NvimTreeToggle<CR>", { noremap = true, silent = true })
    keymap.set('n', "<leader>w", ":wa<CR>", { noremap = true, silent = true })
    keymap.set('n', "<leader>x", ":qa!<CR>", { noremap = true, silent = true })
    keymap.set('n', "<leader>z", ":wqa<CR>", { noremap = true, silent = true })
  end
}
