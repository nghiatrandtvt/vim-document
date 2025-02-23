require('gitsigns').setup {
  signs = {
    add          = { text = '│' },
    change       = { text = '│' },
    delete       = { text = '_' },
    topdelete    = { text = '‾' },
    changedelete = { text = '~' },
  },
  signcolumn = true,
  numhl      = false,
  linehl     = false,
  current_line_blame = true, -- enable display virtual git blame.
  word_diff  = false,
 
  on_attach = function(bufnr)
    local gs = package.loaded.gitsigns
 
    -- Keymaps
    vim.api.nvim_buf_set_keymap(bufnr, 'n', ']c', '<cmd>lua require"gitsigns".next_hunk()<CR>', { noremap = true, silent = true })
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '[c', '<cmd>lua require"gitsigns".prev_hunk()<CR>', { noremap = true, silent = true })
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>hs', '<cmd>lua require"gitsigns".stage_hunk()<CR>', { noremap = true, silent = true })
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>hr', '<cmd>lua require"gitsigns".reset_hunk()<CR>', { noremap = true, silent = true })
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>hp', '<cmd>lua require"gitsigns".preview_hunk()<CR>', { noremap = true, silent = true })
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>gb', '<cmd>lua require"gitsigns".blame_line{ full = true }<CR>', { noremap = true, silent = true })
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>gd', '<cmd>lua require"gitsigns".diffthis()<CR>', { noremap = true, silent = true })
  end
}
