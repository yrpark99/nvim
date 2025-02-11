return {
  "hedyhli/outline.nvim",
  lazy = true,
  cmd = { "Outline", "OutlineOpen" },
  keys = {
    { "<leader>o", "<Cmd>Outline<CR>", desc = "Toggle outline" },
  },
  opts = {
    outline_items = {
      show_symbol_details = false,
    },
    symbols = {
      filter = { "Function" },
    },
  },
}
