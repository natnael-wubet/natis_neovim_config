-- ~/.config/nvim/lua/core.lua
local api = vim.api

-- Function to adjust the width of current active split
local keymap = vim.keymap.set
local opts = { noremap=true }

keymap("n", "<C-Up>", ":resize +1 <CR>", opts)
keymap("n", "<C-Down>", ":resize -1 <CR>", opts)
keymap("n", "<C-Left>", ":vertical:resize +1 <CR>", opts)
keymap("n", "<C-Right>", ":vertical:resize -1 <CR>", opts)


keymap("n", "<C-h>", ":wincmd h<cr>", { desc = "Go to left split" })
keymap("n", "<C-j>", ":wincmd j<cr>", { desc = "Go to bottom split" })
keymap("n", "<C-k>", ":wincmd k<cr>", { desc = "Go to upper split" })
keymap("n", "<C-l>", ":wincmd l<cr>", { desc = "Go to right split" })

-- vim.api.nvim_set_keymap("i", "<Down>", "<Esc>gja", { noremap = true })
vim.api.nvim_set_keymap("x", "<Down>", "gj", {})

vim.api.nvim_set_keymap("n", "<Up>", "gk", {})
vim.api.nvim_set_keymap("n", "<Down>", "gj", {})

vim.api.nvim_set_keymap("n", "<Up>", "gk", {})
vim.o.tabstop=2
vim.o.shiftwidth=2
vim.o.number = true
vim.o.relativenumber = true
vim.o.wrap = true            -- Enable horizontal scroll wrapping
vim.o.whichwrap = "l,[,],h"  -- Allow cursor to move across lines smoothly
