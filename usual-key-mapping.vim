let mapleader=" " "default leader key is backslash (\). Now change to SPC

" exit from terminal mode
tnoremap <Esc> <C-\><C-n>

nnoremap <leader>do :NvimTreeOpen 
nnoremap <leader>dw :NvimTreeResize 
nnoremap <leader>bd :ls<CR>:bd!
nnoremap <leader>r :source $MYVIMRC<CR>

inoremap <C-d> <Esc>ddi
inoremap <C-r> <Esc>d$i
inoremap <C-l> <Esc>d0i

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
