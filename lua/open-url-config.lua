vim.keymap.set("v", "<leader>ju", function()
  vim.cmd('normal! "zy')
  local url = vim.fn.getreg('z')
 
  if url == "" then
    print("No URL selected")
    return
  end
 
  url = vim.trim(url)
 
  local open_cmd
  if vim.fn.has("linux") == 1 then
    open_cmd = "xdg-open"
  elseif vim.fn.has("mac") == 1 then
    open_cmd = "open"
  elseif vim.fn.has("win32") == 1 then
    open_cmd = "start"
  else
    print("Unsupported OS")
    return
  end
 
  print("Opening: " .. url)
  vim.fn.jobstart({open_cmd, url}, {detach = true})
end, { desc = "Open-selected-URL-in-browser" })

vim.keymap.set("n", "<leader>gO", function()
  url = "<url>"
 
  local open_cmd
  if vim.fn.has("linux") == 1 then
    open_cmd = "xdg-open"
  elseif vim.fn.has("mac") == 1 then
    open_cmd = "open"
  elseif vim.fn.has("win32") == 1 then
    open_cmd = "start"
  else
    print("Unsupported OS")
    return
  end
 
  print("Opening: " .. url)
  vim.fn.jobstart({open_cmd, url}, {detach = true})
end, { desc = "Open-Gerrit-home-page" })

vim.keymap.set("n", "<leader>go", function()
  local changeId = vim.fn.getreg('+')
  print("Value in clipboard: " .. changeId)
  
  if changeId:sub(1, 1) ~= "I" then
    local cmd = string.format("git show %s | grep 'Change-Id' | awk '{print $2}'", changeId)
	changeId = vim.fn.system(cmd):gsub("\n", "")
  end
  
  if changeId == "" then
    print("No changeId")
	return
  end
  url = "<url>/#/q/" .. changeId
 
  local open_cmd
  if vim.fn.has("linux") == 1 then
    open_cmd = "xdg-open"
  elseif vim.fn.has("mac") == 1 then
    open_cmd = "open"
  elseif vim.fn.has("win32") == 1 then
    open_cmd = "start"
  else
    print("Unsupported OS")
    return
  end
 
  print("Opening: " .. url)
  vim.fn.jobstart({open_cmd, url}, {detach = true})
end, { desc = "Open-Gerrit-with-changeId" })