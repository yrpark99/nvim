return {
  "lewis6991/gitsigns.nvim",
  config = function()
    require("gitsigns").setup()
    vim.keymap.set("n", "<leader>gn", "<cmd>Gitsigns next_hunk<CR>", {})
    vim.keymap.set("n", "<leader>gp", "<cmd>Gitsigns prev_hunk<CR>", {})
    vim.keymap.set("n", "<leader>gd", "<cmd>Gitsigns preview_hunk<CR>", {})
    vim.keymap.set("n", "<leader>gr", "<cmd>Gitsigns reset_hunk<CR>", {})
    vim.keymap.set("n", "<F5>", "<cmd>Gitsigns next_hunk<CR>", {})
    vim.keymap.set("n", "<F17>", "<cmd>Gitsigns prev_hunk<CR>", {}) -- Shift+F5
    vim.keymap.set("n", "<F6>", "<cmd>Gitsigns preview_hunk<CR>", {})
  end,
}
