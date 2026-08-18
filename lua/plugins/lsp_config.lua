return {
  "nvim-lspconfig",
  opts = function(_, opts)
    opts.inlay_hints = { enabled = false }
    opts.servers.lua_ls = {
      settings = {
        Lua = {
          workspace = {
            checkThirdParty = false,
            library = {
              vim.env.VIMRUNTIME,
            },
          },
        },
      },
    }
    opts.servers.make_ls = {
      cmd = { "make-ls" },
      filetypes = { "make" },
      root_markers = { "Makefile", "makefile", "GNUmakefile", ".git", ".svn" },
    }
  end,
}
