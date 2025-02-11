-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local Util = require("lazyvim.util")
local map = Util.safe_keymap_set

-- Exit(quit all)
vim.keymap.set({ "n", "i", "v" }, "<A-x>", "<Esc><Cmd>quitall<CR>", { noremap = true, silent = true })

-- Shift-Del
vim.keymap.set({ "n", "v", "i" }, "<S-Del>", function()
  local mode = vim.api.nvim_get_mode().mode
  if mode == "i" then
    return "<Esc>ddi"
  else
    return "dd"
  end
end, { expr = true, desc = "Delete current line" })

-- Alt-Del
vim.keymap.set({ "n", "v", "i" }, "<A-Del>", function()
  local mode = vim.api.nvim_get_mode().mode
  if mode == "i" then
    return "<C-o>D"
  else
    return "D"
  end
end, { expr = true, desc = "Delete from cursor to end of line" })

-- LSP related
map("n", "<A-l>", "<Cmd>LspStop<CR>", { desc = "Stop LSP" })
map("n", "<A-r>", "<Cmd>LspStart<CR>", { desc = "start LSP" })
vim.keymap.set({ "n", "i", "v" }, "<F12>", function()
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "n", false)
  vim.lsp.buf.definition()
end, { noremap = true })

-- Tab indent
vim.keymap.set("v", "<Tab>", ">gv", { noremap = true, silent = true })
vim.keymap.set("v", "<S-Tab>", "<gv", { noremap = true, silent = true })

-- Reopen latest file tab
vim.keymap.set("n", "<C-r>", "<Cmd>ReopenLatest<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>br", "<Cmd>ReopenLatest<CR>", { noremap = true, silent = true })

-- File tabs
vim.keymap.set({ "n", "i", "v" }, "<A-Right>", "<Esc><Cmd>BufferLineMoveNext<CR>", { noremap = true, silent = true })
vim.keymap.set({ "n", "i", "v" }, "<A-Left>", "<Esc><Cmd>BufferLineMovePrev<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>b>", "<Cmd>BufferLineMoveNext<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>b<", "<Cmd>BufferLineMovePrev<CR>", { noremap = true, silent = true })

-- Copy current file path
vim.keymap.set("n", "<leader>fp", function()
  local path = vim.fn.expand("%:p")
  vim.fn.setreg("+", path)
  print("Copied: " .. path)
end, { desc = "Copy file path" })
