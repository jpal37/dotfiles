local keymap = vim.keymap.set

-- File
keymap("n", "<leader>w", "<cmd>write<CR>")

-- Navigation
keymap("n", "<leader><Esc>", "<cmd>nohlsearch<CR>")
keymap("n", "<C-d>", "<C-d>zz")
keymap("n", "<C-u>", "<C-u>zz")
