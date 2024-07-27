return {
  "toppair/peek.nvim",
  event = { "VeryLazy" },
  build = "deno task --quiet build:fast",
  config = function()
    require("peek").setup({
      theme = 'light'
    })
    vim.api.nvim_create_user_command("MarkdownPreview", require("peek").open, {})
  end,
}
