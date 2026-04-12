-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local Util = require("lazyvim.util")
local map = Util.safe_keymap_set

-- Exit(quit all)
vim.keymap.set({ "n", "i", "v" }, "<C-A-q>", "<esc><cmd>quitall<CR>", { noremap = true, silent = true })

-- Remove '\r' at line end in case system clipboard paste
vim.keymap.set('n', 'p', function()
  local content = vim.fn.getreg('+')
  content = content:gsub('\r\n', '\n'):gsub('\r', '')
  vim.fn.setreg('"', content)
  vim.cmd('normal! ""p')
end)

-- Shift-Del
vim.keymap.set({ "n", "v", "i" }, "<S-Del>", function()
  local mode = vim.api.nvim_get_mode().mode
  if mode == "i" then
    return "<esc>ddi"
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

-- Find
vim.keymap.set({ "n", "i" }, "<F3>", "<esc>*", { noremap = true })
vim.keymap.set({ "n", "i" }, "<F15>", "<esc>#", { noremap = true }) -- Shift+F3

-- Move lines
map("n", "<A-Down>", "<cmd>execute 'move .+' . v:count1<cr>==", { desc = "Move Down" })
map("n", "<A-Up>", "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==", { desc = "Move Up" })
map("i", "<A-Down>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down" })
map("i", "<A-Up>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up" })
map("v", "<A-Down>", ":<C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv", { desc = "Move Down" })
map("v", "<A-Up>", ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv", { desc = "Move Up" })

-- LSP related
map("n", "<A-l>", "<cmd>lsp disable<CR>", { desc = "Disable LSP" })
map("n", "<A-r>", "<cmd>lsp enable<CR>", { desc = "Enable LSP" })
vim.keymap.set({ "n", "i" }, "<F12>", "<esc>gd", { remap = true })
vim.keymap.set({ "n", "i" }, "<F24>", "<esc>gr", { remap = true }) -- Shift+F12
vim.keymap.set({ "n", "i", "v" }, '<F36>', "<esc><cmd>EagleWin<CR>", { noremap = true, silent = true }) -- Ctrl+F12

-- Line/block comment (Ctrl+\)
vim.keymap.set({ "n", "i" }, "<C-\\>", "<esc>gcc", { remap = true })
vim.keymap.set("v", "<C-\\>", "gc", { remap = true })

-- Tab indent
vim.keymap.set("v", "<Tab>", ">gv", { noremap = true, silent = true })
vim.keymap.set("v", "<S-Tab>", "<gv", { noremap = true, silent = true })

-- Reopen latest file tab
vim.keymap.set("n", "<S-t>", "<cmd>ReopenLatest<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>br", "<cmd>ReopenLatest<CR>", { noremap = true, silent = true, desc = "Reopen latest closed tab" })

-- Jump to last modified position in current file
vim.keymap.set("n", "<C-q>", "`.", { noremap = true, silent = true, desc = "Jump to last modified position" })
vim.keymap.set("n", "<leader>bq", "`.", { noremap = true, silent = true, desc = "Jump to last modified position" })

-- File tabs
vim.keymap.set({ "n", "i", "v" }, "<F28>", "<esc><cmd>bdelete<CR>", { noremap = true, silent = true }) -- Ctrl+F4
vim.keymap.set({ "n", "i", "v" }, "<A-Right>", "<esc><cmd>BufferLineMoveNext<CR>", { noremap = true, silent = true })
vim.keymap.set({ "n", "i", "v" }, "<A-Left>", "<esc><cmd>BufferLineMovePrev<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>b>", "<cmd>BufferLineMoveNext<CR>", { noremap = true, silent = true, desc = "Move current tab to next" })
vim.keymap.set("n", "<leader>b<", "<cmd>BufferLineMovePrev<CR>", { noremap = true, silent = true, desc = "Move current tab to previous" })

-- Todo-comments
vim.keymap.set({ "n", "i", "v" }, "<C-A-t>", "<esc><cmd>TodoLocList<CR>", { noremap = true, silent = true })

-- Copy current file name
vim.keymap.set("n", "<leader>fx", function()
  local path = vim.fn.expand("%:o")
  local name = vim.fs.basename(path)
  vim.fn.setreg("+", name)
  print("Copied: " .. name)
end, { desc = "Copy current file name" })

-- Copy current file absolute path
vim.keymap.set("n", "<leader>fy", function()
  local path = vim.fn.expand("%:p")
  vim.fn.setreg("+", path)
  print("Copied: " .. path)
end, { desc = "Copy current file absolute path" })

-- Copy current file relative path
vim.keymap.set("n", "<leader>fz", function()
  local path = vim.fn.expand("%:.")
  vim.fn.setreg("+", path)
  print("Copied: " .. path)
end, { desc = "Copy current file relative path" })
