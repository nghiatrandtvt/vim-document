vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup({
  sort = {
    sorter = "case_sensitive",
  },
  renderer = {
    group_empty = true,
    highlight_opened_files = "icon",
    highlight_modified = "icon",
    full_name = true,
  },
  modified = {
    enable = true,
  },
})

vim.api.nvim_set_hl(0, "NvimTreeSymlink", { fg = "#98e4de", italic = true })
vim.api.nvim_set_hl(0, "NvimTreeFolderArrowClosed", { fg = "#FFFF00" })
vim.api.nvim_set_hl(0, "NvimTreeFolderArrowOpen", { fg = "#70dbb7" })
vim.api.nvim_set_hl(0, "NvimTreeExecFile", { fg = "#00FF00" })
vim.api.nvim_set_hl(0, "NvimTreeFolderName", { fg = "#00BFFF" })
