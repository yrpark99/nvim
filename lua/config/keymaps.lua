-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local Util = require("lazyvim.util")
local map = Util.safe_keymap_set

-- LSP key map
map("n", "<C-l>", "<cmd>LspStop<cr>", { desc = "Stop LSP" })
map("n", "<C-r>", "<cmd>LspStart<cr>", { desc = "start LSP" })

-- Indent key map
vim.keymap.set('v', '<Tab>', '>gv', { noremap = true })
vim.keymap.set('v', '<S-Tab>', '<gv', { noremap = true })

-- Git key map
vim.keymap.set("n", "<F5>", ":Gitsigns next_hunk<CR>", { noremap = true, silent = true })

-- Copy current file path
vim.keymap.set("n", "<leader>fp", function()
  local path = vim.fn.expand("%:p")
  vim.fn.setreg("+", path)
  print("Copied: " .. path)
end, { desc = "Copy file path" })
