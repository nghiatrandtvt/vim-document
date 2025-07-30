vim.api.nvim_set_hl(0, 'CustomOverlay', {
  fg = '#00FF00',
  bg = '#333333',
  bold = true,
})

local function show_active_buffer()
  local buf_nr = vim.api.nvim_get_current_buf()
  local message = "ACTIVE"
  local ns_id = vim.api.nvim_create_namespace('show_buffer')
  vim.api.nvim_buf_clear_namespace(buf_nr, ns_id, 0, -1)
  vim.api.nvim_buf_set_extmark(buf_nr, ns_id, 0, 0, {
    virt_text = { { message, "CustomOverlay" } },
    virt_text_pos = "overlay",
  })
  vim.defer_fn(function()
    if vim.api.nvim_buf_is_valid(buf_nr) then
      vim.api.nvim_buf_clear_namespace(buf_nr, ns_id, 0, -1)
    end
  end, 2000)
end

vim.keymap.set('n', '<C-b>', show_active_buffer, { noremap = true, silent = true })
vim.keymap.set('i', '<C-b>', show_active_buffer, { noremap = true, silent = true })
