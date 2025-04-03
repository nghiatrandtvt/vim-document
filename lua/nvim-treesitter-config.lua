require("nvim-treesitter.configs").setup {
  ensure_installed = { "lua", "python", "c", "javascript", "java", "bash", "cpp" },
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  fold = {
    enable = true,
  },
}
