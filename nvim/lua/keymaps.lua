-- ========================================================================== --
--                                  KEYMAPS                                   --
-- ========================================================================== --

-- SOURCE / EXECUTE
vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>", { desc = "Source current file" })
vim.keymap.set("n", "<space>x", ":.lua<CR>",                { desc = "Execute current line" })
vim.keymap.set("v", "<space>x", ":lua<CR>",                { desc = "Execute selection" })

-- NAVIGATION (Word-wise h/l)
-- Note: h is now Back (b) and l is now Forward (w)
vim.keymap.set({ "n", "v", "o" }, "h", "b", { noremap = true, desc = "Move back word" })
vim.keymap.set({ "n", "v", "o" }, "l", "w", { noremap = true, desc = "Move forward word" })

-- BUFFERS
vim.keymap.set("n", "<leader>c", ":bdelete<CR>", { noremap = true, silent = true, desc = "Close buffer" })
vim.keymap.set("n", "<C-[>",     ":bprev<CR>",   { noremap = true, silent = true, desc = "Prev buffer" })
vim.keymap.set("n", "<C-]>",     ":bnext<CR>",   { noremap = true, silent = true, desc = "Next buffer" })

-- WINDOWS & QUITTING
vim.keymap.set("n", "<leader>q", ":qa<CR>", { desc = "Quit all" })

-- MOVING TEXT (Visual Mode)
vim.keymap.set("v", "<C-j>", ":m '>+1<CR>gv=gv", { silent = true, desc = "Move block down" })
vim.keymap.set("v", "<C-k>", ":m '<-2<CR>gv=gv", { silent = true, desc = "Move block up" })

-- QUICKFIX & DIAGNOSTICS
vim.keymap.set("n", "<M-]>",     "<cmd>cnext<CR>", { desc = "Next quickfix item" })
vim.keymap.set("n", "<M-[>",     "<cmd>cprev<CR>", { desc = "Prev quickfix item" })
vim.keymap.set("n", "<M-o>",     "<cmd>copen<CR>", { desc = "Open quickfix window" })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Open diagnostic float" })
vim.keymap.set("n", "<leader>d", function() 
    vim.diagnostic.setqflist() 
end, { desc = "Set quickfix list with diagnostics" })

-- OIL.NVIM
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- ========================================================================== --
--                                 AUTOCMDS                                   --
-- ========================================================================== --

-- HELP WINDOW (Always open on the far right)
vim.api.nvim_create_autocmd("FileType", {
  group   = vim.api.nvim_create_augroup("HelpVerticalSplit", { clear = true }),
  pattern = "help",
  callback = function()
    vim.cmd "wincmd L"
  end,
})
