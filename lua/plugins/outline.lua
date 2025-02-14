return {
  "stevearc/aerial.nvim",
  backends = { "lsp" },
  opts = {
    filter_kind = {
      "Class",
      "Constructor",
      "Function",
      "Interface",
      "Method",
      "Module",
    },
    autojump = false,
  },
  keys = {
    { "<leader>o", "<Cmd>AerialToggle!<CR>", desc = "Toggle Outline" },
  },
}
