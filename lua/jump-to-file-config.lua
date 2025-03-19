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