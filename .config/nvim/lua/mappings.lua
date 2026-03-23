require "nvchad.mappings"

local unmap = vim.keymap.del
local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("i", "<M-Space>", require("cmp").complete, { desc = "Trigger completion" })
map("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Actions" })

-- local ts_folds_enabled = false
--
-- local function toggle_treesitter_folds()
--   ts_folds_enabled = not ts_folds_enabled
--
--   if ts_folds_enabled then
--     vim.opt.foldmethod = "expr"
--     vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
--   else
--     vim.opt.foldmethod = "manual"
--     vim.opt.foldexpr = "0"
--     vim.cmd "normal! zE"
--   end
-- end
--
-- map("n", "<leader>zf", toggle_treesitter_folds, {
--   desc = "Toggle Treesitter Folds",
-- })
--
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
