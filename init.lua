-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- Set Vim options
vim.opt.fileencodings = "utf-8, euc-kr"
vim.opt.relativenumber = false
vim.opt.termguicolors = true

-- Set clipboard
vim.defer_fn(function()
  vim.opt.clipboard = "unnamedplus"
end, 1000)

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
