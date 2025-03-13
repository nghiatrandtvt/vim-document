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
  },
  modified = {
    enable = true,
  },
})
