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

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

local M = {}

M.crates = {
  n = {
    ["<leader>rcu"] = {
      function ()
        require("crate").upgrade_all_crates()
      end,
      "update crates"
    }
  }
}

return M
