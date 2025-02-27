call plug#begin('~/.local/share/nvim/site/plugged')
Plug 'preservim/nerdtree' "file and directory management
                          "see nerdtree section in vim cheatsheet to know how
                          "to use
 
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

Plug 'mbbill/undotree' "show history of file

Plug 'sindrets/winshift.nvim' "to swap window

Plug 'ellisonleao/glow.nvim' "markdown

Plug 'mhinz/vim-startify' "session management

Plug 'nvim-lualine/lualine.nvim' "status bar display

Plug 'nvim-tree/nvim-web-devicons' "icon

Plug 'windwp/nvim-autopairs' "auto pair
call plug#end()
 
" THEME
colorscheme dracula 
syntax enable
set termguicolors
" END THEME
 
" CONFIGURE CURSOR DISPLAY FOR INSERT MODE (i means INSERT)
set guicursor+=i:blinkwait700-blinkoff400-blinkon250
set guicursor+=i:block
highlight Cursor guibg=#888888
" END CURSOR CONFIGURATION
 
syntax on "enable syntax
filetype plugin indent on "automatically detect filetype, enable correspoding plugin and indent base on filetype
 
set number "display line number

" disable line number and set background color for specific buffer such as terminal buffer
autocmd BufEnter,TermOpen,BufRead term://* setlocal nonumber norelativenumber "not display line number for some specific buffers such as terminal
autocmd TermOpen,BufRead term://* setlocal winhighlight=Normal:TermNormal
highlight TermNormal guibg=#000000

" change background for nerdtree directory window
autocmd FileType nerdtree setlocal winhighlight=Normal:NERDTreeBg
highlight NERDTreeBg guibg=#000000

set wildmode=longest:full,full "in COMMAND mode, when tab it will display long list of command
set list
set listchars=tab:→\ ,trail:·,extends:>,precedes:<,nbsp:·,eol:↲
set expandtab "tab to space
set tabstop=4 "number of space for a tab
set shiftwidth=4 "number of space when using for indent operator such as >> or <<
set softtabstop=4 "number of space when tab in insert mode
set splitbelow "open window in below when :split
set splitright "open window in right when :vsplit

set clipboard=unnamedplus "always copy to clipboard register, not default register as default
                          "it will benefit when paste with SPC-p (alias of "+p) that
						  "always fetch from clipboard register
						  "clipboard register is "+
						  "default register is "0 or "
 
let mapleader=" " "default leader key is backslash (\). Now change to SPC

set undofile
set undodir=<neovim_config_path>/undodir

set autoread
autocmd FocusGained,BufEnter * checktime
 
" exit from terminal mode
tnoremap <Esc> <C-\><C-n>

" paste
nnoremap <leader>p "+p
nnoremap <leader>do :NERDTree 
nnoremap <leader>bd :ls<CR>:bd!
inoremap <C-d> <Esc>ddi

" command alias 
" open nerdtree in combination with new tab
command! -complete=dir -nargs=* Dt tabnew | execute 'NERDTree' <q-args>
let g:NERDTreeWinSize = 40 "NERD window size
 
" use up/down arrow in wild mode (command mode when press TAB)
cnoremap <expr> <Up> wildmenumode() ? "\<C-p>" : "\<Up>"
cnoremap <expr> <Down> wildmenumode() ? "\<C-n>" : "\<Down>"

" open file at cursor
function! OpenFileAtCursor()
    let l:filepath = expand('<cfile>')

    if !isdirectory(l:filepath) && !filereadable(l:filepath)
        let l:filepath = expand('%:p:h') . '/' . l:filepath
    endif

    if filereadable(l:filepath)
        execute 'tabedit ' . fnameescape(l:filepath)
    else
        echo "No such file: " . l:filepath
    endif
endfunction

" tab display
function! MyTabLine()
    let s = ''
    for i in range(tabpagenr('$'))
        let tabnr = i + 1
        let winnr = tabpagewinnr(tabnr)
        let bufnr = tabpagebuflist(tabnr)[winnr - 1]
        let bufname = bufname(bufnr)
        let filename = fnamemodify(bufname, ':t')
        let s .= (tabnr == tabpagenr() ? '%#TabLineSel#' : '%#TabLine#')
        let s .= ' ' . tabnr . ':' . (filename == '' ? '[No Name]' : filename) . ' '
    endfor
    let s .= '%#TabLineFill#'
    return s
endfunction
set tabline=%!MyTabLine()
 
" LSP CONFIGURATION and KEYBINDING
" use capabilities for auto complete in combination with nvim cmp
" clangd for c/c++. Need to install clangd and add to PATH
" pyright for python. Need to install pyright and add to PATH
" bash language server. Need to install bash language server and add to PATH
" some of them are using NPM to install, so need nodejs to be installed ahead
" load cmp config. Default is from .config/nvim/lua/cmp-config.lua 
lua << EOF
vim.api.nvim_set_keymap("n", "<leader>o", ":call OpenFileAtCursor()<CR>", { noremap = true, silent = true, desc = "open-file-at-cursor" })

require('nvim-web-devicons-config')
require('whichkey')
require("cmp-config")
require('telescope-config')
require('lualine-config')
require('glow-config')
require('lspsaga-config')
require('gitsigns-config')
require('jdtls-config')

local capabilities = require("cmp_nvim_lsp").default_capabilities()
require'lspconfig'.clangd.setup{ capabilities = capabilities }
require'lspconfig'.pyright.setup{ capabilities = capabilities }
require'lspconfig'.bashls.setup{}

vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { noremap=true, silent=true })
vim.keymap.set("n", 'gr', require("telescope.builtin").lsp_references, { noremap = true, silent = true })

EOF

highlight TelescopeSelection guibg=#800080 "telescope