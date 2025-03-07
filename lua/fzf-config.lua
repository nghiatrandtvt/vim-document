vim.keymap.set("n", "<leader>scs", function()
  local full_word = vim.fn.expand("<cword>")
  local word = full_word:match("^[^/]+") or full_word
  local fzf_options = "--color=hl:yellow,hl+:cyan --query " .. vim.fn.shellescape(word)
  vim.fn["fzf#vim#buffer_lines"](word, {
    ["options"] = fzf_options,
  })
end, { desc = "FzF-search-under-cursor-current-buf" })

vim.keymap.set("n", "<leader>sct", function()
  local full_word = vim.fn.expand("<cword>")
  local word = full_word:match("^[^/]+") or full_word
  local fzf_options = "--color=hl:yellow,hl+:cyan --query " .. vim.fn.shellescape(word)
  vim.fn["fzf#vim#lines"](word, {
    ["options"] = fzf_options,
  })
end, { desc = "FzF-search-under-cursor-all-buf" })

vim.keymap.set("v", "<leader>ss", function()
  vim.cmd('normal! "zy')
  local selected_text = vim.fn.getreg('z')
  local fzf_options = "--color=hl:yellow,hl+:cyan --query " .. vim.fn.shellescape(selected_text)
  vim.fn["fzf#vim#buffer_lines"](selected_text, {
    ["options"] = fzf_options,
  })
end, { desc = "FZF-search-selected-text-current-buf" })

vim.keymap.set("v", "<leader>st", function()
  vim.cmd('normal! "zy')
  local selected_text = vim.fn.getreg('z')
  local fzf_options = "--color=hl:yellow,hl+:cyan --query " .. vim.fn.shellescape(selected_text)
  vim.fn["fzf#vim#lines"](selected_text, {
    ["options"] = fzf_options,
  })
end, { desc = "FZF-search-selected-text-all-buf" })
