local highlights = vim.api.nvim_create_augroup("Highlights", { clear = true })

vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking text",
  group = highlights,
  callback = function() vim.hl.on_yank() end,
  }
)
