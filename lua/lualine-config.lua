require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'powerline_dark',
    section_separators = { left = '', right = '' },
    component_separators = { left = '', right = '' }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {
        {'branch', icon = {'',align='left', color={fg='yellow', gui = 'bold'}}}
    },
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  }
}
