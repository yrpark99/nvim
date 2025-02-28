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
    autojump = true,
  },
  keys = {
    { "<leader>o", "<cmd>AerialToggle!<CR>", desc = "Toggle Outline" },
  },
}
