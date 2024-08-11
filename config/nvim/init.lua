vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.softtabstop = 2

vim.opt.number = true
vim.opt.clipboard:append "unnamedplus"
vim.opt.mouse = ""
vim.g.mapleader = ","

local keymap = vim.keymap
keymap.set('n', "<leader>ln", ":set relativenumber!<CR>", { noremap = true, silent = true })
keymap.set('n', 'm', "<Cmd>call append(line('.'),     repeat([''], v:count1))<CR>")
keymap.set('n', 'M', "<Cmd>call append(line('.') - 1, repeat([''], v:count1))<CR>")

require "custom/lazy"
