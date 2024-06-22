-- Tabs
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.softtabstop = 2

-- Line Numbers
vim.opt.number = true

-- Clipboard
vim.opt.clipboard:append "unnamedplus"

-- Mouse
vim.opt.mouse = ""

-- Leader
vim.g.mapleader = ","

vim.cmd('autocmd BufNewFile,BufRead *.vert set filetype=glsl')
vim.cmd('autocmd BufNewFile,BufRead *.frag set filetype=glsl')

-- Keymap
local keymap = vim.keymap
keymap.set('n', "<leader>ln", ":set relativenumber!<CR>", {noremap = true, silent = true})
keymap.set('n', 'm', "<Cmd>call append(line('.'),     repeat([''], v:count1))<CR>")
keymap.set('n', 'M', "<Cmd>call append(line('.') - 1, repeat([''], v:count1))<CR>")



-- Start Lazy
require "custom/lazy"
