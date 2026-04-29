return {
  "folke/snacks.nvim",
  opts = {
    explorer = {},
    indent = {
      priority = 1,
      enabled = true,
      char = "│",
      only_scope = false,
      only_current = false,
      hl = "SnacksIndent"
    },
  },
  keys = {
    { "<C-e>", function() Snacks.explorer() end, desc = "Toggle explorer", mode = {"n", "i"} },
    { "<C-\\>", function() Snacks.terminal.toggle() end, desc = "Toggle Terminal", mode = {"n", "i", "t"} },
  }
}
