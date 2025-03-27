-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
local map = vim.keymap.set

map("n", "WW", ":w<CR>", { noremap = true, silent = true })
map("i", "jj", "<ESC>", { noremap = true, silent = true })
map("n", "<C-c>", 'ggVG"+y', { noremap = true, silent = true })
map("v", "<C-c>", 'ggVG"+y', { noremap = true, silent = true })
