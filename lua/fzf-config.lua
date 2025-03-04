vim.keymap.set("n", "<leader>sb", function()
  local full_word = vim.fn.expand("<cword>")
  local word = full_word:match("^[^/]+") or full_word
  local fzf_options = "--color=hl:yellow,hl+:cyan --query " .. vim.fn.shellescape(word)
  vim.fn["fzf#vim#buffer_lines"](word, {
    ["sink"] = "e",
    ["options"] = fzf_options,
  })
end, { desc = "FzF-search-under-cursor-current-buf" })
