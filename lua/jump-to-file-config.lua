function OpenFileAtCursorPwd()
  local current_buf = vim.api.nvim_get_current_buf()
 
  local buf_type = vim.api.nvim_buf_get_option(current_buf, 'buftype')
  if buf_type ~= 'terminal' then
    print("Current buffer is not a terminal. Please switch to a terminal buffer.")
    return nil
  end
 
  local ok, chan = pcall(vim.api.nvim_buf_get_var, current_buf, 'terminal_job_id')
  if not ok then
    print("No terminal channel found.")
    return nil
  end
 
  vim.api.nvim_chan_send(chan, "pwd\n")
 
  vim.wait(100)
 
  local line = vim.api.nvim_buf_get_lines(current_buf, vim.api.nvim_buf_line_count(current_buf) - 2, vim.api.nvim_buf_line_count(current_buf) - 1, false)[1]
 
  local filepath = vim.fn.expand('<cfile>')
  filepath = line .. '/' .. filepath
  if vim.fn.filereadable(filepath) == 1 then
    vim.cmd('tabedit ' .. vim.fn.fnameescape(filepath))
  else
    print("No such file: " .. filepath)
  end
end

vim.keymap.set("v", "<leader>jf", function()
	vim.cmd('normal! "zy')
	local filepath = vim.fn.getreg('z')

    if vim.fn.filereadable(filepath) == 1 then
		vim.cmd('tabedit ' .. vim.fn.fnameescape(filepath))
	else
		print("No such file: " .. filepath)
	end
end, { desc = "open-selected-file" })

vim.keymap.set("n", "<leader>jf", function()
	local filepath = vim.fn.expand('<cfile>')

    if vim.fn.filereadable(filepath) == 1 then
		print("Openning " .. filepath)
		vim.cmd('tabedit ' .. vim.fn.fnameescape(filepath))
	else
		print("No such file: " .. filepath)
	end
end, { desc = "open-under-cursor-file" })

vim.keymap.set("v", "<leader>jp", function()
  vim.cmd('normal! "zy')
  local selected_file = vim.fn.getreg('z')
  
  local dir = vim.fn.input("Enter path: ", vim.fn.getcwd(), "dir")
  if dir == "" then
    print("No directory specified")
    return
  end
  
  if vim.fn.isdirectory(dir) == 0 then
    print("Invalid directory: " .. dir)
    return
  end
  
  selected_file = dir .. '/' .. selected_file

  if vim.fn.filereadable(selected_file) == 1 then
    vim.cmd('tabedit ' .. vim.fn.fnameescape(selected_file))
  else
	print("No such file: " .. selected_file)
  end
end, { desc = "open-selected-file-with-path" })
