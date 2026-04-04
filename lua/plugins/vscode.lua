return {
  "Mofiqul/vscode.nvim",
  config = function()
    require("vscode").setup({
      italic_comments = false,
      transparent = true,
      group_overrides = {
        CursorLine = { bg = "#353535" },
        SnacksIndent = { fg = "#303030" },
        SnacksIndentScope = { fg = "#b07700" },
        NeoTreeCursorLine = { bg = "#373737" },
        NvimTreeCursorLine = { bg = "#373737" },
        ["@lsp.type.comment.c"] = { fg = "#909090" },
        ["@lsp.type.comment.cpp"] = { fg = "#909090" },
        ["@lsp.type.property.c"] = { fg = "#f36fa8" },
        ["@lsp.type.property.cpp"] = { fg = "#f36fa8" },
      },
    })
  end,
}
