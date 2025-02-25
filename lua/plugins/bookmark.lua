return {
  "yrpark99/navimark.nvim",
  dependencies = {
    "nvim-telescope/telescope.nvim",
    "nvim-lua/plenary.nvim",
  },
  config = function()
    require("navimark").setup({
      keymap = {
        base = {
          mark_toggle = "<C-A-k>",
          goto_next_mark = "<C-A-l>",
          open_mark_picker = "<C-A-p>",
        },
      },
      sign = {
        text = "",
        color = "#0c61f4",
      },
      persist = true,
    })
  end,
}
