-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost",
  {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank",
    { clear = true }),
  callback = function() vim.highlight.on_yank() end,
  })

-- Pick up file changes made outside the current nvim instance.
-- `autoread` only enables reloading; `checktime` is what actually asks vim to detect changes.
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold", "CursorHoldI", "TermClose", "TermLeave" }, {
  desc = "Reload files changed outside of nvim",
  group = vim.api.nvim_create_augroup("checktime_on_focus", { clear = true }),
  callback = function()
    if vim.fn.mode() ~= "c" then
      vim.cmd("checktime")
    end
  end,
})

vim.api.nvim_create_autocmd("FileChangedShellPost", {
  desc = "Notify when a file reloads after an external change",
  group = vim.api.nvim_create_augroup("file_changed_shell_notify", { clear = true }),
  callback = function()
    vim.notify("File reloaded from disk", vim.log.levels.INFO, { title = "nvim" })
  end,
})
