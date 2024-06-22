return {
  "norcalli/nvim-colorizer.lua",
  name = "colorizer",
  config = function()
    local keymap = vim.keymap
    keymap.set('n', "<leader>C", ":ColorizerToggle<CR>", { noremap = true, silent = true })
  end
}
