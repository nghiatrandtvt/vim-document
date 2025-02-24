local wk = require("which-key")
wk.add({
  { "<leader>r", ":source $MYVIMRC<CR>", desc = "source-init-vim", remap = false },
  
  { "<leader>h", ":wincmd h<CR>", desc = "move-wd-left", remap = false },
  { "<leader>j", ":wincmd j<CR>", desc = "move-wd-down", remap = false },
  { "<leader>k", ":wincmd k<CR>", desc = "move-wd-up", remap = false },
  { "<leader>l", ":wincmd l<CR>", desc = "move-wd-right", remap = false },
  
  { "<leader>b", group = "buffers" },
  { "<leader>bs", "<cmd>Telescope buffers<cr>", desc = "select-buffer" },
  { "<leader>bd", "<cmd>ls<cr><cmd>bd!", desc = "delete-buffer" },
  { "<leader>bn", "<cmd>bnext<cr>", desc = "next-buffer" },
  
  { "<leader>t", group = "tab-term-telescope" },
  { "<leader>tn", "<cmd>tabnext<cr>", desc = "next-tab" },
  { "<leader>to", "<cmd>tabnew<cr>", desc = "new-tab" },
  { "<leader>t1", "<cmd>1tabnext<cr>", desc = "1st-tab" },
  { "<leader>t2", "<cmd>2tabnext<cr>", desc = "2nd-tab" },
  { "<leader>t3", "<cmd>3tabnext<cr>", desc = "3rt-tab" },
  { "<leader>t4", "<cmd>4tabnext<cr>", desc = "4th-tab" },
  { "<leader>t5", "<cmd>5tabnext<cr>", desc = "5th-tab" },
  { "<leader>t6", "<cmd>6tabnext<cr>", desc = "6th-tab" },
  { "<leader>t7", "<cmd>7tabnext<cr>", desc = "7th-tab" },
  { "<leader>t8", "<cmd>8tabnext<cr>", desc = "8th-tab" },
  { "<leader>t9", "<cmd>9tabnext<cr>", desc = "9th-tab" },
  { "<leader>tt", "<cmd>tabnew | terminal<cr>", desc = "new-tab-terminal" },
  { "<leader>tv", "<cmd>vsplit | terminal<cr>", desc = "vertical-terminal" },
  { "<leader>th", "<cmd>split | terminal<cr>", desc = "horizontal-terminal" },
  { "<leader>tk", "<cmd>Telescope keymaps<cr>", desc = "show-keymaps" },
  { "<leader>tc", "<cmd>Telescope commands<cr>", desc = "show-commands" },
  
  { "<leader>s", group = "search" },
  { "<leader>sf", "<cmd>Files<cr>", desc = "search-file-current-dir" },
  { "<leader>ss", "<cmd>BLines<cr>", desc = "grep-string-current-file" },
  { "<leader>sa", "<cmd>Telescope live_grep<cr>", desc = "grep-string-current-dir" },
  
  { "<leader>d", group = "directory" },
  { "<leader>dt", "<cmd>NERDTreeToggle<cr>", desc = "directory-toggle" },
  { "<leader>df", "<cmd>NERDTreeFind<cr>", desc = "directory-find" },
  { "<leader>do", "<cmd>NERDTree ", desc = "directory-open" },
  
  { "<leader>f", group = "file-copy" },
  { "<leader>fa", "<cmd>let @+=expand('%:p')<cr>", desc = "copy-absolutely-file-path" },
  { "<leader>fr", "<cmd>let @+=expand('%')<cr>", desc = "copy-relative-file-path" },
  { "<leader>fn", "<cmd>let @+=expand('%:t')<cr>", desc = "copy-file-name-only" },
  
  { "<leader>x", "<cmd>WinShift swap<cr>", desc = "window-swap" },
  
  { "<leader>c", group = "code-action" },
  { "<leader>cr", "<cmd><cmd>Lspsaga rename<CR>", desc = "code rename" },
  { "<leader>ch", "<cmd>Lspsaga hover_doc<CR>", desc = "code hover" },
  { "<leader>ca", "<cmd>Lspsaga code_action<CR>", desc = "code action" },
  { "<leader>cd", "<cmd>Lspsaga show_line_diagnostics<cr>", desc = "code diagnostics" },
  
  { "<leader>g", group = "git-action" },
  { "<leader>gb", "<cmd>Telescope git_bcommits<CR>", desc = "show-file-commits" },
  { "<leader>gc", "<cmd>Telescope git_commits<CR>", desc = "show-repo-commits" },
})
nnoremap <leader>tk :Telescope keymaps<CR>
nnoremap <leader>tc :Telescope commands<CR>