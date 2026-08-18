return {
  "mason-org/mason-lspconfig.nvim",
  opts = {
    ensure_installed = {
      "bashls",
      "clangd",
      "dockerls",
      "gopls",
      "lua_ls",
      "pyright",
      "rust_analyzer",
      "ts_ls"
    }
  }
}
