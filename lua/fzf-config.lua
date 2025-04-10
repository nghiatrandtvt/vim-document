vim.keymap.set("n", "<leader>scs", function()
  local full_word = vim.fn.expand("<cword>")
  local word = full_word:match("^[^/]+") or full_word
  local fzf_options = "--color=hl:yellow,hl+:cyan --query " .. vim.fn.shellescape(word)
  vim.fn["fzf#vim#buffer_lines"](word, {
    ["options"] = fzf_options,
  })
end, { desc = "FzF-search-under-cursor-current-buf" })

vim.keymap.set("n", "<leader>scS", function()
  local full_word = vim.fn.expand("<cword>")
  local word = full_word:match("^[^/]+") or full_word
  local fzf_options = "--color=hl:yellow,hl+:cyan --query " .. vim.fn.shellescape(word)
  vim.fn["fzf#vim#lines"](word, {
    ["options"] = fzf_options,
  })
end, { desc = "FzF-search-under-cursor-all-buf" })

vim.keymap.set("n", "<leader>scf", function()
  local full_path = vim.fn.expand("<cfile>")
  if full_path == "" then
    print("No file path under cursor")
    return
  end
  
  local filename = full_path:match("[^/]+$") or full_path
  local fzf_options = "--color=hl:yellow,hl+:cyan --query " .. vim.fn.shellescape(filename)

  vim.fn["fzf#vim#files"]("", {
    options = fzf_options,
  }, 0)
end, { desc = "FZF-search-file-under-cursor-current-dir" })

vim.keymap.set("n", "<leader>scF", function()
  local full_path = vim.fn.expand("<cfile>")
  if full_path == "" then
    print("No file path under cursor")
    return
  end
  
  local filename = full_path:match("[^/]+$") or full_path
  local search_dir = vim.fn.input("Enter directory: ", vim.fn.getcwd(), "dir")
  if search_dir == "" then
    print("No directory specified.")
    return
  end
  
  if vim.fn.isdirectory(search_dir) == 0 then
    print("Invalid directory: " .. search_dir)
    return
  end
  
  local fzf_options = "--color=hl:yellow,hl+:cyan --query " .. vim.fn.shellescape(filename)
  
  vim.fn["fzf#vim#files"](search_dir, {
    options = fzf_options,
  }, 0)
end, { desc = "FZF-search-file-under-cursor-with-input-dir" })

vim.keymap.set("v", "<leader>ss", function()
  vim.cmd('normal! "zy')
  local selected_text = vim.fn.getreg('z')
  local fzf_options = "--color=hl:yellow,hl+:cyan --query " .. vim.fn.shellescape(selected_text)
  vim.fn["fzf#vim#buffer_lines"](selected_text, {
    ["options"] = fzf_options,
  })
end, { desc = "FZF-search-selected-text-current-buf" })

vim.keymap.set("v", "<leader>sS", function()
  vim.cmd('normal! "zy')
  local selected_text = vim.fn.getreg('z')
  local fzf_options = "--color=hl:yellow,hl+:cyan --query " .. vim.fn.shellescape(selected_text)
  vim.fn["fzf#vim#lines"](selected_text, {
    ["options"] = fzf_options,
  })
end, { desc = "FZF-search-selected-text-all-buf" })

vim.keymap.set("v", "<leader>sf", function()
  vim.cmd('normal! "zy')
  local selected_file = vim.fn.getreg('z')
  local fzf_options = "--color=hl:yellow,hl+:cyan --query " .. vim.fn.shellescape(selected_file)
  vim.fn["fzf#vim#lines"]("", {
    ["options"] = fzf_options,
  }, 0)
end, { desc = "FZF-search-file-current-dir" })

vim.keymap.set("v", "<leader>sF", function()
  vim.cmd('normal! "zy')
  local selected_file = vim.fn.getreg('z')
  local search_dir = vim.fn.input("Enter directory: ", vim.fn.getcwd(), "dir")
  if search_dir == "" then
    print("No directory specified.")
    return
  end
  
  if vim.fn.isdirectory(search_dir) == 0 then
    print("Invalid directory: " .. search_dir)
    return
  end
  
  local fzf_options = "--color=hl:yellow,hl+:cyan --query " .. vim.fn.shellescape(selected_file)
  
  vim.fn["fzf#vim#files"](search_dir, {
    options = fzf_options,
  }, 0)
end, { desc = "FZF-search-selected-file-with-input-dir" })
