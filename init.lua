-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- Set Vim options
vim.opt.fileencodings = "utf-8, euc-kr"
vim.opt.relativenumber = false
vim.opt.termguicolors = true

-- Set color scheme
vim.cmd("colorscheme vscode")

-- Set cursor line number foreground color
vim.cmd("highlight CursorLineNr guifg=#ff8c00")

-- Set Neo-tree color
vim.api.nvim_set_hl(0, "NeoTreeIndentMarker", { fg = "#404040" })
vim.api.nvim_set_hl(0, "NeoTreeWinSeparator", { fg = "#FF7F00" })
vim.api.nvim_set_hl(0, "NeoTreeRootName", { fg = "#FF0000" })

-- Set visual non text foreground color
vim.api.nvim_set_hl(0, "VisualNonText", {
  bg = vim.api.nvim_get_hl(0, { name = "Visual" }).bg,
  fg = "#585858",
})

-- Set bookmark color
vim.api.nvim_set_hl(0, "navimark_hl", { fg = "#0C61F4" })

-- Set file type for specific file name and extension
vim.filetype.add({
  filename = {
    ["nset"] = "make",
  },
  extension = {
    inc = "make",
  },
})
