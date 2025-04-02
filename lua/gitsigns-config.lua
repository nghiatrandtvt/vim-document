--require("nvim-web-devicons").setup {
--  default = true,
--}

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
}

vim.api.nvim_set_keymap('n', ']c', '<cmd>lua require"gitsigns".next_hunk()<CR>', { noremap = true, silent = true, desc = "next-hunk" })
vim.api.nvim_set_keymap('n', '[c', '<cmd>lua require"gitsigns".prev_hunk()<CR>', { noremap = true, silent = true, desc = "previous-hunk" })
vim.api.nvim_set_keymap('n', '<leader>hs', '<cmd>lua require"gitsigns".stage_hunk()<CR>', { noremap = true, silent = true, desc = "stage-hunk" })
vim.api.nvim_set_keymap('n', '<leader>hr', '<cmd>lua require"gitsigns".reset_hunk()<CR>', { noremap = true, silent = true, desc = "reset-hunk" })
vim.api.nvim_set_keymap('n', '<leader>hp', '<cmd>lua require"gitsigns".preview_hunk()<CR>', { noremap = true, silent = true, desc = "preview-hunk" })
vim.api.nvim_set_keymap('n', '<leader>gb', '<cmd>lua require"gitsigns".blame_line{ full = true }<CR>', { noremap = true, silent = true, desc = "git-blame-line" })
vim.api.nvim_set_keymap('n', '<leader>gB', '<cmd>lua require"gitsigns".blame{ full = true }<CR>', { noremap = true, silent = true, desc = "git-blame" })
vim.api.nvim_set_keymap('n', '<leader>gd', '<cmd>lua require"gitsigns".diffthis()<CR>', { noremap = true, silent = true, desc = "git-diff-current-file" })
