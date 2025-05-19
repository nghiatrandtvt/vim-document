require("nvim-web-devicons").setup {
  default = true,
}

local function get_window_number()
  return "wnu-" .. vim.api.nvim_win_get_number(0)
end

require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'powerline_dark',
    section_separators = { left = '', right = '' },
    component_separators = { left = '', right = '' },
    globalstatus = true,
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {
        {'branch', icon = {'',align='left', color={fg='yellow', gui = 'bold'}}}
    },
    lualine_c = {'filename'},
    lualine_x = {get_window_number, 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  }
}
