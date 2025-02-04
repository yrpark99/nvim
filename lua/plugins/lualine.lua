local function detect_indentation()
  local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
  local tab_count = 0
  local space_count = 0
  local space_width = 0
  local in_multiline_comment = false

  for _, line in ipairs(lines) do
    if line:match('^%s*/%*') then
      in_multiline_comment = true
    end
    if in_multiline_comment then
      if line:match('%*/') then
        in_multiline_comment = false
      end
      goto continue
    end

    if line:match('^\t') then
      tab_count = tab_count + 1
    elseif line:match('^ +') then
      local space_leading = line:match('^( +)')
      space_count = space_count + 1
      if (space_width == 0) then
        space_width = #space_leading
      end
    end

    if space_count > 10 or tab_count > 10 then
      break
    end

    ::continue::
  end

  if space_count > tab_count then
    return 'Spaces: ' .. space_width
  elseif tab_count > space_count then
    return 'Tab Size: ' .. vim.bo.shiftwidth
  else
    local shift_width = vim.bo.shiftwidth
    local expand_tab = vim.bo.expandtab
    if expand_tab then
      return 'Spaces: ' .. shift_width
    else
      return 'Tab Size: ' .. shift_width
    end
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
      lualine_x = {'encoding', 'fileformat', 'filetype', detect_indentation },
      lualine_y = {'progress'},
      lualine_z = {'location'}
    },
    tabline = {},
    winbar = {},
    inactive_winbar = {},
    extensions = {}
  }
}
