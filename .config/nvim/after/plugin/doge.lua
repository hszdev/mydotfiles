-- Generate comment for current line.
-- nmap <silent> <Leader>d <Plug>(doge-generate)
vim.api.nvim_set_keymap("n", "<Leader>d", "<Plug>(doge-generate)", {noremap = true, silent = true})

-- Interactive mode comment todo-jumping.
vim.api.nvim_set_keymap("n", "<TAB>", "<Plug>(doge-comment-jump-forward)", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<S-TAB>", "<Plug>(doge-comment-jump-backward)", {noremap = true, silent = true})
vim.api.nvim_set_keymap("i", "<TAB>", "<Plug>(doge-comment-jump-forward)", {noremap = true, silent = true})
vim.api.nvim_set_keymap("i", "<S-TAB>", "<Plug>(doge-comment-jump-backward)", {noremap = true, silent = true})
vim.api.nvim_set_keymap("s", "<TAB>", "<Plug>(doge-comment-jump-forward)", {noremap = true, silent = true})
vim.api.nvim_set_keymap("s", "<S-TAB>", "<Plug>(doge-comment-jump-backward)", {noremap = true, silent = true})
