-- keymaks are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local Util = require("lazyvim.util")
local map = Util.safe_keymap_set

-- Exit(quit all)
vim.keymap.set({ "n", "i", "v" }, "<A-q>", "<Esc><Cmd>quitall<CR>", { noremap = true, silent = true })

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

-- Move lines
map("n", "<A-Down>", "<cmd>execute 'move .+' . v:count1<cr>==", { desc = "Move Down" })
map("n", "<A-Up>", "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==", { desc = "Move Up" })
map("i", "<A-Down>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down" })
map("i", "<A-Up>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up" })
map("v", "<A-Down>", ":<C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv", { desc = "Move Down" })
map("v", "<A-Up>", ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv", { desc = "Move Up" })

-- LSP related
map("n", "<A-l>", "<Cmd>LspStop<CR>", { desc = "Stop LSP" })
map("n", "<A-r>", "<Cmd>LspStart<CR>", { desc = "start LSP" })
vim.keymap.set({ "n", "i", "v" }, "<F12>", function()
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "n", false)
  vim.lsp.buf.definition()
end, { noremap = true })

-- Visual block comment
vim.keymap.set("v", "<C-_>", "gc", { remap = true }) -- Ctrl+/

-- Tab indent
vim.keymap.set("v", "<Tab>", ">gv", { noremap = true, silent = true })
vim.keymap.set("v", "<S-Tab>", "<gv", { noremap = true, silent = true })

-- Reopen latest file tab
vim.keymap.set("n", "<C-r>", "<Cmd>ReopenLatest<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>br", "<Cmd>ReopenLatest<CR>", { noremap = true, silent = true })

-- File tabs
vim.keymap.set({ "n", "i", "v" }, "<F28>", "<Esc><Cmd>bdelete<CR>", { noremap = true, silent = true }) -- Ctrl+F4
vim.keymap.set({ "n", "i", "v" }, "<A-Right>", "<Esc><Cmd>BufferLineMoveNext<CR>", { noremap = true, silent = true })
vim.keymap.set({ "n", "i", "v" }, "<A-Left>", "<Esc><Cmd>BufferLineMovePrev<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>b>", "<Cmd>BufferLineMoveNext<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>b<", "<Cmd>BufferLineMovePrev<CR>", { noremap = true, silent = true })

-- Neo-tree
vim.keymap.set("n", "\\", "<Cmd>Neotree filesystem reveal left<CR>", {})
vim.keymap.set("n", "<leader>f\\", "<Cmd>Neotree filesystem reveal left<CR>", { noremap = true, silent = true })

-- todo-comments
vim.keymap.set({ "n", "i", "v" }, "<C-A-t>", "<Esc><Cmd>TodoLocList<CR>", { noremap = true, silent = true })

-- Copy current file path
vim.keymap.set("n", "<leader>fp", function()
  local path = vim.fn.expand("%:p")
  vim.fn.setreg("+", path)
  print("Copied: " .. path)
end, { desc = "Copy file path" })
