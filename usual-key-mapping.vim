let mapleader=" " "default leader key is backslash (\). Now change to SPC

" exit from terminal mode
tnoremap <Esc> <C-\><C-n>

nnoremap <leader>do :NvimTreeOpen 
nnoremap <leader>dw :NvimTreeResize 
nnoremap <leader>bd :ls<CR>:bd!
nnoremap <leader>r :source $MYVIMRC<CR>

inoremap <C-Left> <Esc>:wincmd h<CR>
inoremap <C-Down> <Esc>:wincmd j<CR>
inoremap <C-Up> <Esc>:wincmd k<CR>
inoremap <C-Right> <Esc>:wincmd l<CR>

tnoremap <C-Left> <C-\><C-n>:wincmd h<CR>
tnoremap <C-Down> <C-\><C-n>:wincmd j<CR>
tnoremap <C-Up> <C-\><C-n>:wincmd k<CR>
tnoremap <C-Right> <C-\><C-n>:wincmd l<CR>

nnoremap <C-Left> <Esc>:wincmd h<CR>
nnoremap <C-Down> <Esc>:wincmd j<CR>
nnoremap <C-Up> <Esc>:wincmd k<CR>
nnoremap <C-Right> <Esc>:wincmd l<CR>

inoremap <C-d> <Esc>ddi
inoremap <A-d> <Esc>diwi
inoremap <A-S-d> <Esc>diWi
inoremap <C-l> <Esc>d$i
inoremap <C-a> <Esc>d0i

inoremap <C-y> <Esc>^y$i
nnoremap <C-y> ^y$

nnoremap <C-k> "+p
inoremap <C-k> <Esc>"+pi

" command alias 
" open nvimtree in combination with new tab
command! -complete=dir -nargs=* Dt tabnew | execute 'NvimTreeOpen' <q-args>

command! -nargs=1 CopyToClipboard let @+ = <q-args> | echo "Copied to clipboard: " . <q-args>
 
" use up/down arrow in wild mode (command mode when press TAB)
cnoremap <expr> <Up> wildmenumode() ? "\<C-p>" : "\<Up>"
cnoremap <expr> <Down> wildmenumode() ? "\<C-n>" : "\<Down>"
