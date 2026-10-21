local hl = vim.api.nvim_create_augroup("Highlights", { clear = true })

vim.api.nvim_create_autocmd("TextYankPost", {
  group = hl,
  callback = function() vim.hl.on_yank() end,
  }
)
