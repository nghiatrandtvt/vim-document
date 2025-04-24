call plug#begin('~/.local/share/nvim/site/plugged')
Plug 'nvim-tree/nvim-tree.lua' 
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } "fzf binary
Plug 'junegunn/fzf.vim' "search file in directory, grep string from current cmp-buffer
                        "see fzf section in vim cheatsheet to know how to use
 
Plug 'nvim-lua/plenary.nvim' "need for telescope
Plug 'nvim-telescope/telescope.nvim' "show commit history for repo, show commit history for current buffer
                                     "see telescope section in vim cheatsheet to know how to use
 
Plug 'lewis6991/gitsigns.nvim' "git blame, git diff
                               "see gitsigns section in vim cheatsheet to know
                               "how to use
 
Plug 'dracula/vim' "dracula theme
Plug 'joshdick/onedark.vim' "onedark theme - coloscheme onedark
Plug 'kaicataldo/material.vim' "material theme - colorscheme material
Plug 'altercation/vim-colors-solarized' "solarized theme - colorscheme solarized
Plug 'arcticicestudio/nord-vim' "nord theme - colorscheme nord
Plug 'morhetz/gruvbox' "gruvbox theme - colorscheme gruvbox
 
Plug 'folke/which-key.nvim' "which key
 
Plug 'preservim/nerdcommenter' "comment/uncomment, <SPC>-cc, <SPC>-cu
 
Plug 'neovim/nvim-lspconfig' "go to definition, go to define, auto import. Need to install clangd if using for c/c++, pyright for python
                             "see lsp section in vim cheatsheet to know how to use
Plug 'nvimdev/lspsaga.nvim' "UI for lsp
 
Plug 'hrsh7th/nvim-cmp'        " main plugin for autocomplete
Plug 'hrsh7th/cmp-nvim-lsp'    " fetch data from nvim-lspconfig plugin
Plug 'hrsh7th/cmp-buffer'      " fetch data from current buffer
Plug 'hrsh7th/cmp-cmdline'     " autocomplete for command line 
Plug 'L3MON4D3/LuaSnip'        " snippet support

Plug 'mfussenegger/nvim-jdtls'

Plug 'sindrets/winshift.nvim' "to swap window

Plug 'ellisonleao/glow.nvim' "markdown

Plug 'mhinz/vim-startify' "session management

Plug 'nvim-lualine/lualine.nvim' "status bar display

Plug 'nvim-tree/nvim-web-devicons' "icon

Plug 'windwp/nvim-autopairs' "auto pair

Plug 'tpope/vim-surround'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

Plug 'tpope/vim-fugitive'
call plug#end()
 
" THEME
colorscheme dracula 
syntax enable
set termguicolors
" END THEME
 
syntax on "enable syntax
filetype plugin indent on "automatically detect filetype, enable correspoding plugin and indent base on filetype
 
set number "display line number

" disable line number and set background color for specific buffer such as terminal buffer
autocmd BufEnter,TermOpen,BufRead term://* setlocal nonumber norelativenumber "not display line number for some specific buffers such as terminal
autocmd TermOpen,BufRead term://* setlocal winhighlight=Normal:TermNormal
highlight TermNormal guibg=#333333

highlight NvimTreeNormal guibg=#3f3f4e

set wildmode=longest:full,full "in COMMAND mode, when tab it will display long list of command
set list
set listchars=tab:→\ ,trail:·,extends:>,precedes:<,nbsp:·,eol:↲
set expandtab "tab to space
set tabstop=4 "number of space for a tab
set shiftwidth=4 "number of space when using for indent operator such as >> or <<
set softtabstop=4 "number of space when tab in insert mode
set splitbelow "open window in below when :split
set splitright "open window in right when :vsplit

set colorcolumn=80 "highlight line at column 80

set clipboard=unnamedplus "always copy to clipboard register, not default register as default
                          "it will benefit when paste with SPC-p (alias of "+p) that
						  "always fetch from clipboard register
						  "clipboard register is "+
						  "default register is "0 or "

" update file content realtime (for example when change branch or change commit on Git)
set autoread
autocmd FocusGained,BufEnter * checktime

source ~/.config/nvim/cursor-custom.vim
source ~/.config/nvim/usual-key-mapping.vim
source ~/.config/nvim/jump-to-file.vim
source ~/.config/nvim/tabline-custom.vim
 
" LSP CONFIGURATION and KEYBINDING
" use capabilities for auto complete in combination with nvim cmp
" clangd for c/c++. Need to install clangd and add to PATH
" pyright for python. Need to install pyright and add to PATH
" bash language server. Need to install bash language server and add to PATH
" some of them are using NPM to install, so need nodejs to be installed ahead
" load cmp config. Default is from .config/nvim/lua/cmp-config.lua 
lua << EOF
require('jump-to-file-config')
vim.api.nvim_set_keymap("n", "<leader>jf", ":call OpenFileAtCursor()<CR>", { noremap = true, silent = true, desc = "open-file-at-cursor" })
vim.api.nvim_set_keymap("n", "<leader>jp", ":call OpenFileWithPath()<CR>", { noremap = true, silent = true, desc = "open-file-at-cursor-with=path" })
vim.api.nvim_set_keymap("n", "<leader>jd", ":call GotoDirAtCursor()<CR>", { noremap = true, silent = true, desc = "goto-dir-at-cursor" })
vim.api.nvim_set_keymap("n", "<leader>jF", ":lua OpenFileAtCursorPwd()<CR>", { noremap = true, silent = true, desc = "goto-file-at-cursor-pwd-only-use-in-terminal" })

require('nvim-treesitter-config')
require('nvim-tree-config')
require('nvim-web-devicons-config')
require('whichkey')
require("cmp-config")
require('telescope-config')
require('lualine-config')
require('glow-config')
require('lspsaga-config')
require('gitsigns-config')
require('jdtls-config')
require('fzf-config')
require('nvim-treesitter-config')
require('open-url-config')

local capabilities = require("cmp_nvim_lsp").default_capabilities()
require'lspconfig'.clangd.setup{ 
  capabilities = capabilities,
  filetypse = { "c", "cpp" },
  cmd = { "clangd", "--compile-commands-dir=<dir_to_compile_commands.json>" }
}
require'lspconfig'.pyright.setup{ capabilities = capabilities }
require'lspconfig'.bashls.setup{}

vim.diagnostic.config({
  virtual_text = { current_line = true },
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})

vim.keymap.set("n", 'gr', require("telescope.builtin").lsp_references, { noremap = true, silent = true })
vim.keymap.set("n", 'gd', require("telescope.builtin").lsp_implementations, { noremap = true, silent = true })
vim.keymap.set('i', '<C-h>', vim.lsp.buf.signature_help, { noremap = true, silent = true })

EOF
