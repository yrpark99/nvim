local function display_indent_info()
  local shift_width = vim.bo.shiftwidth
  local expand_tab = vim.bo.expandtab
  if expand_tab then
    return "Spaces: " .. shift_width
  else
    return "Tab Size: " .. shift_width
  end
end

local function cursor_position()
  local line = vim.fn.line(".")
  local col = vim.fn.charcol(".")
  return string.format("Ln %d, Col %d", line, col)
end

local function get_char_visual_area(s_pos, e_pos)
  local s_row, s_col = s_pos[2], s_pos[3]
  local e_row, e_col = e_pos[2], e_pos[3]

  if s_row > e_row or (s_row == e_row and s_col > e_col) then
    return e_row, e_col, s_row, s_col
  end
  return s_row, s_col, e_row, e_col
end

local function get_line_visual_area(s_pos, e_pos)
  local s_row = s_pos[2]
  local e_row = e_pos[2]

  if s_row > e_row then
    local s_col = string.len(vim.fn.getline(s_row)) + 1
    local e_col = 1
    return e_row, e_col, s_row, s_col
  end

  local s_col = 1
  local e_col = string.len(vim.fn.getline(e_row)) + 1
  return s_row, s_col, e_row, e_col
end

local function get_lines_chars_area(start_row, start_col, end_row, end_col)
  local lines_count = end_row - start_row + 1
  local chars_count = 0

  if lines_count == 1 then
    chars_count = end_col - start_col + 1
    return lines_count, chars_count
  end

  for row = start_row, end_row do
    local line = vim.fn.getline(row)
    if row == start_row then
      chars_count = string.len(string.sub(line, start_col)) + 1
    elseif row == end_row then
      chars_count = chars_count + end_col
    else
      chars_count = chars_count + string.len(line) + 1
    end
  end
  return lines_count, chars_count
end

local function visual_selection_count()
  local mode = vim.fn.mode()
  if mode ~= "v" and mode ~= "V" then
    return ""
  end

  local s_pos = vim.fn.getpos("v")
  local e_pos = vim.fn.getpos(".")
  local start_row, start_col, end_row, end_col
  if mode == "v" then
    start_row, start_col, end_row, end_col = get_char_visual_area(s_pos, e_pos)
  elseif mode == "V" then
    start_row, start_col, end_row, end_col = get_line_visual_area(s_pos, e_pos)
  end

  local lines_count, chars_count = get_lines_chars_area(start_row, start_col, end_row, end_col)
  return "(" .. lines_count .. " lines, " .. chars_count .. " chars)"
end

return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  opts = {
    options = {
      icons_enabled = true,
      theme = {
        normal = {
          a = { bg = "#98c379", fg = "#000000" },
          b = { bg = "#333333", fg = "#e8e8e8" },
          c = { bg = "#333333", fg = "#d75bea" },
          x = { bg = "#333333", fg = "#ffb27d" },
          y = { bg = "#333333", fg = "#fff200" },
          z = { bg = "#333333", fg = "#60c5f1" },
        },
        insert = {
          a = { bg = "#61afef", fg = "#000000" },
          z = { bg = "#333333", fg = "#60c5f1" },
        },
        visual = {
          a = { bg = "#c678dd", fg = "#000000" },
          z = { bg = "#333333", fg = "#60c5f1" },
        },
        replace = {
          a = { bg = "#e06c75", fg = "#000000" },
          z = { bg = "#333333", fg = "#60c5f1" },
        },
        command = {
          a = { bg = "#e5c07b", fg = "#000000" },
          z = { bg = "#333333", fg = "#60c5f1" },
        },
      },
      component_separators = { left = "", right = "" },
      section_separators = { left = "", right = "" },
      disabled_filetypes = {
        statusline = {},
        winbar = {},
      },
      ignore_focus = {},
      always_divide_middle = true,
      globalstatus = true,
      refresh = {
        statusline = 200,
        tabline = 1000,
        winbar = 1000,
      },
    },
    sections = {
      lualine_a = { "mode" },
      lualine_b = { { "filename", path = 1 } },
      lualine_c = { visual_selection_count },
      lualine_x = { "encoding", "fileformat", "filetype", display_indent_info },
      lualine_y = { "progress" },
      lualine_z = { cursor_position },
    },
  },
}
