return {
  "Mofiqul/vscode.nvim",
  config = function()
    require('vscode').setup({
      italic_comments = false,
      transparent = true,
      group_overrides = {
        CursorLine = { bg = '#505050' },
      }
    })
  end
}
