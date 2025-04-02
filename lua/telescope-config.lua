local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")

local function checkout_commit(prompt_bufnr)
  local selection = action_state.get_selected_entry()
  if selection then
    local commit_hash = selection.value:match("^%S+")

    actions.close(prompt_bufnr)
    vim.fn.system("git checkout " .. commit_hash)
    print("Checked out commit: " .. commit_hash)
  end
end

local function copy_commit_hash(prompt_bufnr)
  local selection = action_state.get_selected_entry()
  if selection then
    local commit_hash = selection.value:match("^%S+")
    vim.fn.setreg('+', commit_hash)
    actions.close(prompt_bufnr)
    print("Copied commit hash to clipboard: " .. commit_hash)
  end
end

require('telescope').setup{
  defaults = {
    prompt_prefix = "🔍 ",
    selection_caret = "➜ ",
	vimgrep_arguments = {
	  'ag', '--nocolor', '--noheading', '--numbers', '--column'
	}
  },
  pickers = {
    git_commits = {
      mappings = {
        i = {
          ["<CR>"] = checkout_commit,
		  ["<C-y>"] = copy_commit_hash,
        },
        n = {
          ["<CR>"] = checkout_commit,
		  ["<C-y>"] = copy_commit_hash,
        },
      },
    },
	git_bcommits = {
      mappings = {
        i = {
		  ["<C-y>"] = copy_commit_hash,
        },
        n = {
		  ["<C-y>"] = copy_commit_hash,
        },
      },
    },
  },
}

vim.api.nvim_create_autocmd("User", {
  pattern = "TeleScopePreviewerLoaded",
  callback = function()
    vim.wo.number = true
	vim.wo.relativenumber = false
	vim.wo.cursorline = true
  end
})

vim.keymap.set("n", "<leader>sca", function()
  local full_word = vim.fn.expand("<cword>")
  local word = full_word:match("^[^/]+") or full_word
  require("telescope.builtin").live_grep({
    default_text = word,
  })
end, { desc = "telescope-search-under-cursor-current-dir" })

vim.keymap.set("v", "<leader>sa", function()
  vim.cmd('normal! "zy')
  local selected_text = vim.fn.getreg('z')
  require("telescope.builtin").live_grep({
    default_text = selected_text,
  })
end, { desc = "telescope-search-selected-text-current-dir" })
