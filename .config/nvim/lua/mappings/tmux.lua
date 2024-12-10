local map = vim.keymap.set

if os.getenv "TMUX" then
  map({ "n", "i", "v" }, "<C-h>", "<cmd> TmuxNavigateLeft <cr>")
  map({ "n", "i", "v" }, "<C-j>", "<cmd> TmuxNavigateDown <cr>")
  map({ "n", "i", "v" }, "<C-k>", "<cmd> TmuxNavigateUp <cr>")
  map({ "n", "i", "v" }, "<C-l>", "<cmd> TmuxNavigateRight <cr>")
end
