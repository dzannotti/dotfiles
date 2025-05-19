-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("i", "jj", "<ESC>")
map("n", "<leader><leader>", ":", { desc = "Command mode" })
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<leader>ck", function()
  vim.cmd("edit " .. vim.fn.stdpath("config") .. "/lua/config/keymaps.lua")
end, { desc = "Edit keymaps.lua" })

vim.keymap.set("n", "<leader>fg", function()
  require("telescope.builtin").live_grep()
end, { desc = "Find text (grep)" })

vim.keymap.set("n", "<leader>p", "O<Esc>p", { desc = "Paste above with new line" })
vim.keymap.set("n", "<leader>P", "o<Esc>p", { desc = "Paste below with new line" })
