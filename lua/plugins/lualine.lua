return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  opts = {
    options = {
      icons_enabled = true,
      theme = {
        normal = {
          c = { bg = '#333333' }
        },
      },
      component_separators = { left = '', right = ''},
      section_separators = { left = '', right = ''},
      disabled_filetypes = {
        statusline = {},
        winbar = {},
      },
      ignore_focus = {},
      always_divide_middle = true,
      globalstatus = true,
      refresh = {
        statusline = 1000,
        tabline = 1000,
        winbar = 1000,
      }
    },
    sections = {
      lualine_a = {'mode'},
      lualine_b = {},
      lualine_c = {LazyVim.lualine.pretty_path()},
      lualine_x = {'encoding', 'fileformat', 'filetype',
        function()
          local shift_width = vim.api.nvim_buf_get_option(0, 'shiftwidth')
          local expand_tab = vim.api.nvim_buf_get_option(0, 'expandtab')
          if expand_tab then
            return 'Spaces: ' .. shift_width
          else
            return 'Tab: ' .. shift_width
          end
        end
      },
      lualine_y = {'progress'},
      lualine_z = {'location'}
    },
    tabline = {},
    winbar = {},
    inactive_winbar = {},
    extensions = {}
  }
}
