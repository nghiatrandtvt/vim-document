-- Copy a commit url to clipboard
-- Required input: a commit hash must be copied into clipboard somehow in advance
-- then run <leader>gc to open a commit url from browser
-- For example:
--   Do <leader>gB -> yiw (at the short commit hash) -> <leader>gc
-- This keymap is not for lazygit because it's not inside lazygit
vim.keymap.set('n', '<leader>gc', function()
	local hash = vim.fn.getreg('+')
	vim.fn.system = '<copy-commit-lazygit.sh fullpath> ' .. hash
end, { desc = 'copy full url to clipboard' })

-- Open a commit url on browser directly
-- Required input: a commit hash must be copied into clipboard somehow in advance
-- then run <leader>go to open a commit url from browser
-- For example:
--   Do <leader>gB -> yiw (at the short commit hash) -> <leader>go
-- This keymap is not for lazygit because it's not inside lazygit
vim.keymap.set('n', '<leader>go', function()
	local hash = vim.fn.getreg('+')
	vim.fn.system = '<open-commit-lazygit.sh fullpath> ' .. hash
end, { desc = 'open a commit on browser' })

-- Open a commit on browser directly
-- That means you stay on a line on editor and press Ctrl-g to open a commit for that line
-- This keymap primarily works base on blame feature of gitsigns plugin
-- It's not for lazygit because it's not inside lazygit
vim.keymap.set('n', '<c-g>', function()
  local blame = vim.b.gitsigns_blame_line_dict
  if blame then
    local hash = blame.sha
    vim.fn.system('<open-git-url-script> ' .. hash)
  end
end, { desc = 'open commit url from git blame' })

-- Copy a commit url to clipboard
-- That means you stay on a line on editor and press Alt-g to copy a commit url
-- This keymap primarily works base on blame feature of gitsigns plugin
-- It's not for lazygit because it's not inside lazygit
vim.keymap.set('n', '<a-g>', function()
  local blame = vim.b.gitsigns_blame_line_dict
  if blame then
    local hash = blame.sha
    vim.fn.system('<copy-git-url-script> ' .. hash)
  end
end, { desc = 'copy commit url from git blame' })