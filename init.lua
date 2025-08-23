-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- Set Vim options
vim.o.fileencodings = "utf-8, euc-kr"
vim.o.mousemoveevent = true
vim.o.relativenumber = false
vim.o.termguicolors = true

-- Set color scheme
vim.cmd("colorscheme vscode")

-- Set cursor line number foreground color
vim.cmd("highlight CursorLineNr guifg=#ff8c00")

-- Set bookmark color
vim.api.nvim_set_hl(0, "navimark_hl", { fg = "#0c61f4" })

-- Set float popup background color
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#2c2c2c" })

-- Set visual non text foreground color (for tab/space charachter color in visual area)
vim.api.nvim_set_hl(0, "VisualNonText", {
  bg = vim.api.nvim_get_hl(0, { name = "Visual" }).bg,
  fg = "#585858",
})

-- Set Neovide
vim.g.neovide_cursor_animation_length = 0
vim.g.neovide_position_animation_length = 0
vim.g.neovide_detach_on_quit = 'always_quit'
vim.cmd("highlight Normal guibg=#151515")
