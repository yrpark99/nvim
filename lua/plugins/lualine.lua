local function get_tab_space_info()
  local shift_width = vim.bo.shiftwidth
  local expand_tab = vim.bo.expandtab
  if expand_tab then
    return 'Spaces: ' .. shift_width
  else
    return 'Tab Size: ' .. shift_width
  end
end

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
      lualine_c = { { 'filename', path = 1 } },
      lualine_x = {'encoding', 'fileformat', 'filetype', get_tab_space_info },
      lualine_y = {'progress'},
      lualine_z = {'location'}
    },
    tabline = {},
    winbar = {},
    inactive_winbar = {},
    extensions = {}
  }
}
