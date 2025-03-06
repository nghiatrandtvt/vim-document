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

vim.keymap.set("n", "<leader>sca", function()
  local full_word = vim.fn.expand("<cword>")
  local word = full_word:match("^[^/]+") or full_word
  require("telescope.builtin").live_grep({
    default_text = word,
  })
end, { desc = "telescope-search-under-cursor-current-dir" })

vim.keymap.set("v", "<leader>sva", function()
  vim.cmd('normal! "zy')
  local selected_text = vim.fn.getreg('z')
  require("telescope.builtin").live_grep({
    default_text = selected_text,
  })
end, { desc = "telescope-search-selected-text-current-dir" })
