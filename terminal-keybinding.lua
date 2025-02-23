vim.api.nvim_set_keymap('n', '<leader>tt', ':tabnew | terminal<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>tv', ':vsplit | terminal<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>th', ':split | terminal<CR>', { noremap = true, silent = true })