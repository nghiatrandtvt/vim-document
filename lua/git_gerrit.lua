vim.keymap.set('n', '<leader>gc', function()
	local hash = vim.fn.getreg('+')
	vim.fn.system = '<copy-commit-lazygit.sh fullpath> ' .. hash
end, { desc = 'copy full url to clipboard' })