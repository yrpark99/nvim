-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- Set Vim options
vim.opt.clipboard = "unnamedplus"
vim.opt.fileencodings = "utf-8, euc-kr"
vim.opt.relativenumber = false
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.termguicolors = true

-- Set color scheme
vim.cmd("colorscheme vscode")

-- Set cursor line number foreground color
vim.cmd("highlight CursorLineNr guifg=#ff8c00")

-- Set file type for specific file name and extension
vim.filetype.add({
  filename = {
    ["nset"] = "make",
  },
  extension = {
    inc = "make",
  },
})
