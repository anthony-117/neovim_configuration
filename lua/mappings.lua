require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '>-2<CR>gv=gv")
map("v", "<leader>y", "\"+y")
map("x", "<leader>p", "\"_dP")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

local builtin = require('telescope.builtin')


map("n", "<leader>ps", function()
	builtin.grep_string({ search = vim.fn.input("Grep > ")})

end)

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
