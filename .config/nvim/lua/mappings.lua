require "nvchad.mappings"

-- add yours here

local unmap = vim.keymap.del
local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("i", "<M-Space>", require("cmp").complete, { desc = "Trigger completion" })
map("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Actions" })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
