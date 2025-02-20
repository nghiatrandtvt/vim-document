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
 
Plug 'itchyny/lightline.vim' "file display information, mode in status bar
 
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
call plug#end()

nnoremap <leader>tk :Telescope keymaps<CR>
nnoremap <leader>tc :Telescope commands<CR>
 
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
autocmd BufEnter,TermOpen,BufRead term://* setlocal nonumber norelativenumber "not display line number for some specific buffers such as terminal
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
 
" KEY BINDING CONFIGURATION
" assign key binding to leader key as prefix
" leader key is SPC (space)
" using 'which-key.nvim' plugin and then press SPC to see all supported key
"
" reload nvim with SPC-r
nnoremap <leader>r :source $MYVIMRC<CR>
 
" move cursor between windows
" move left/down/up/right
nnoremap <silent> <leader>h :wincmd h<CR>
nnoremap <silent> <leader>j :wincmd j<CR>
nnoremap <silent> <leader>k :wincmd k<CR>
nnoremap <silent> <leader>l :wincmd l<CR>
 
" swap betwwen windows
" swap left/down/up/right
nnoremap <silent> <leader>x :WinShift swap<CR>
 
" BUFFER KEYBINDING
" next buffer/select buffer/delete buffer
nnoremap <silent> <leader>bn :bnext<CR>
nnoremap <leader>bs :Telescope buffers<CR>
nnoremap <leader>bd :ls<CR>:bd!
 
" TAB KEYBINDING
" next tab
nnoremap <leader>tn :tabnext<CR>
nnoremap <leader>to :tabnew
nnoremap <leader>t1 :1tabnext<CR>
nnoremap <leader>t2 :2tabnext<CR>
nnoremap <leader>t3 :3tabnext<CR>
nnoremap <leader>t4 :4tabnext<CR>
nnoremap <leader>t5 :5tabnext<CR>
nnoremap <leader>t6 :6tabnext<CR>
nnoremap <leader>t7 :7tabnext<CR>
nnoremap <leader>t8 :8tabnext<CR>
nnoremap <leader>t9 :9tabnext<CR>
 
" FZF KEYBINDING
" FZF find file from specific directory
nnoremap <leader>sf :Files<CR>
" FZF grep string in current buffer. Can use '<string_to_be_grep> to grep
" string exactly than w/o '
nnoremap <leader>ss :BLines<CR>
" grep string in current directory
" another option is to use Ag with FZF. For example
" :Ag <search string>
nnoremap <leader>sa :Telescope live_grep<CR>
 
" exit from terminal mode
tnoremap <Esc> <C-\><C-n>

" paste
nnoremap <leader>p "+p
 
" NERDTREE KEYBINDING
" toggle/find
nnoremap <leader>dt :NERDTreeToggle<CR>
nnoremap <leader>df :NERDTreeFind<CR>
nnoremap <leader>do :NERDTree 
" command alias 
" open nerdtree in combination with new tab
command! -complete=dir -nargs=* Dt tabnew | execute 'NERDTree' <q-args>
let g:NERDTreeWinSize = 40 "NERD window size
 
" use up/down arrow in wild mode (command mode when press TAB)
cnoremap <expr> <Up> wildmenumode() ? "\<C-p>" : "\<Up>"
cnoremap <expr> <Down> wildmenumode() ? "\<C-n>" : "\<Down>"
 
" LSP CONFIGURATION and KEYBINDING
" use capabilities for auto complete in combination with nvim cmp
" clangd for c/c++. Need to install clangd and add to PATH
" pyright for python. Need to install pyright and add to PATH
" bash language server. Need to install bash language server and add to PATH
" some of them are using NPM to install, so need nodejs to be installed ahead
" load cmp config. Default is from .config/nvim/lua/cmp-config.lua 
lua require("cmp-config")

lua << EOF
vim.api.nvim_set_keymap('n', '<leader>tt', ':tabnew | terminal<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>tv', ':vsplit | terminal<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>th', ':split | terminal<CR>', { noremap = true, silent = true })

require('glow').setup({
    style = 'dark',
    width = 100,
    height = 30,
    border = true,
})

local capabilities = require("cmp_nvim_lsp").default_capabilities()
 
require'lspconfig'.clangd.setup{ capabilities = capabilities }
require'lspconfig'.pyright.setup{ capabilities = capabilities }
require'lspconfig'.bashls.setup{}

require("lspsaga").setup({
  ui = {
    border = "rounded",
  },
  symbol_in_winbar = {
    enable = true,
  }

local opts = { noremap=true, silent=true }
--vim.keymap.set("n", "gr", "<cmd>Lspsaga lsp_finder<CR>", opts)
--vim.keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>", opts)
vim.keymap.set("n", "<leader>cr", "<cmd>Lspsaga rename<CR>", opts)
vim.keymap.set("n", "<leader>ch", "<cmd>Lspsaga hover_doc<CR>", opts)
vim.keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts)
vim.keymap.set("n", "<leader>cd", "<cmd>Lspsaga show_line_diagnostics<CR>", opts)
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
--vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
--vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
--vim.keymap.set('n', '<leader>i', vim.lsp.buf.code_action, opts)

-- TELESCOPE CONFIGURATION AND KEYBINDING
require('telescope').setup{
  defaults = {
    prompt_prefix = "🔍 ",
    selection_caret = "➜ ",
	vimgrep_arguments = {
	  'ag', '--nocolor', '--noheading', '--numbers', '--column'
	}
  }
}

-- key binding to show commit history of git repo
-- key binding to show commit history of current buffer
vim.api.nvim_set_keymap('n', '<leader>gh', ":Telescope git_bcommits<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>gc', ":Telescope git_commits<CR>", { noremap = true, silent = true })
 
-- GITSIGNS CONFIGURATION and KEYBINDING
require('gitsigns').setup {
  signs = {
    add          = { text = '│' },
    change       = { text = '│' },
    delete       = { text = '_' },
    topdelete    = { text = '‾' },
    changedelete = { text = '~' },
  },
  signcolumn = true,
  numhl      = false,
  linehl     = false,
  current_line_blame = true, -- enable display virtual git blame.
  word_diff  = false,
 
  on_attach = function(bufnr)
    local gs = package.loaded.gitsigns
 
    -- Keymaps
    vim.api.nvim_buf_set_keymap(bufnr, 'n', ']c', '<cmd>lua require"gitsigns".next_hunk()<CR>', { noremap = true, silent = true })
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '[c', '<cmd>lua require"gitsigns".prev_hunk()<CR>', { noremap = true, silent = true })
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>hs', '<cmd>lua require"gitsigns".stage_hunk()<CR>', { noremap = true, silent = true })
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>hr', '<cmd>lua require"gitsigns".reset_hunk()<CR>', { noremap = true, silent = true })
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>hp', '<cmd>lua require"gitsigns".preview_hunk()<CR>', { noremap = true, silent = true })
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>gb', '<cmd>lua require"gitsigns".blame_line{ full = true }<CR>', { noremap = true, silent = true })
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>gd', '<cmd>lua require"gitsigns".diffthis()<CR>', { noremap = true, silent = true })
  end
}

-- Java with lsp
local function setup_jdtls()
  local jdtls = require('jdtls')
  local config = {
    cmd = { "jdtls" }, -- can use full path to jdtls. If only jdtls, need to set PATH
    root_dir = vim.fn.getcwd(),
    settings = {
      java = {
        home = "<JAVA_HOME>",
      },
    },
  }
  jdtls.start_or_attach(config)
end

-- run jdtls when open Java
vim.api.nvim_create_autocmd("FileType", {
  pattern = "java",
  callback = setup_jdtls,
})
-- end Java with lsp
EOF

highlight TelescopeSelection guibg=#800080 "telescope

function! OpenFileAtCursor()
    let l:filepath = expand('<cfile>')
    if filereadable(l:filepath)
        execute 'tabedit ' . l:filepath  "open file with new tab
    else
        echo "No such file: " . l:filepath
    endif
endfunction
nnoremap <leader>o :call OpenFileAtCursor()<CR>