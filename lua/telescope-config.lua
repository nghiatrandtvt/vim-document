require('telescope').setup{
  defaults = {
    prompt_prefix = "🔍 ",
    selection_caret = "➜ ",
	vimgrep_arguments = {
	  'ag', '--nocolor', '--noheading', '--numbers', '--column'
	}
  }
}

vim.api.nvim_create_autocmd("User", {
  pattern = "TeleScopePreviewerLoaded",
  callback = function()
    vim.wo.number = true
	vim.wo.relativenumber = false
	vim.wo.cursorline = true
  end
})
