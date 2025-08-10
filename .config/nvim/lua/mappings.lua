require "nvchad.mappings"

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map(
  "i",
  "<M-Space>",
  "<Cmd>lua require('cmp').complete()<CR>",
  { desc = "Trigger completion" }
)

if os.getenv "TMUX" then
  map({ "n", "i", "v" }, "<C-h>", "<cmd> TmuxNavigateLeft <cr>")
  map({ "n", "i", "v" }, "<C-j>", "<cmd> TmuxNavigateDown <cr>")
  map({ "n", "i", "v" }, "<C-k>", "<cmd> TmuxNavigateUp <cr>")
  map({ "n", "i", "v" }, "<C-l>", "<cmd> TmuxNavigateRight <cr>")
end

map(
  "n",
  "<leader>ca",
  vim.lsp.buf.code_action,
  { desc = "Code Actions", silent = true }
)
