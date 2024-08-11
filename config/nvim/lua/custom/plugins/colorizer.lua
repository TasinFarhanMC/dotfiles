return {
  "norcalli/nvim-colorizer.lua",
  name = "colorizer",
  config = function()
    require 'colorizer'.setup {}
    vim.keymap.set('n', "<leader>C", ":ColorizerToggle<CR>", { noremap = true, silent = true })
  end
}
