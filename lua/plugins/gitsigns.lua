return {
  "lewis6991/gitsigns.nvim",
  config = function()
    require("gitsigns").setup()
    vim.keymap.set("n", "<leader>gn", "<Cmd>Gitsigns next_hunk<CR>", {})
    vim.keymap.set("n", "<leader>gp", "<Cmd>Gitsigns prev_hunk<CR>", {})
    vim.keymap.set("n", "<leader>gd", "<Cmd>Gitsigns preview_hunk<CR>", {})
    vim.keymap.set("n", "<leader>gr", "<Cmd>Gitsigns reset_hunk<CR>", {})
    vim.keymap.set("n", "<F5>", "<Cmd>Gitsigns next_hunk<CR>", {})
    vim.keymap.set("n", "<F17>", "<Cmd>Gitsigns prev_hunk<CR>", {}) -- Shift+F5
    vim.keymap.set("n", "<F6>", "<Cmd>Gitsigns preview_hunk<CR>", {})
  end,
}
