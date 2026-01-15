--NVIM Source Keymaps.
vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>")
vim.keymap.set("n", "<space>x", ":.lua<CR>")
vim.keymap.set("v", "<space>x", ":lua<cr>")
--HELP WINDOW
vim.api.nvim_create_autocmd("FileType", {
  pattern = "help",
  callback = function()
    -- `wincmd L` moves the current window to be the far-right vertical split
    -- Use `wincmd H` for the far-left vertical split
    vim.cmd "wincmd L"
  end,
  group = vim.api.nvim_create_augroup("HelpVerticalSplit", { clear = true }),
})
--MOVING TEXT
vim.keymap.set("v", "<C-j>", ":m '>+1<CR>gv=gv", { silent = true })
vim.keymap.set("v", "<C-k>", ":m '<-2<CR>gv=gv", { silent = true })
--QUICKFIX
vim.keymap.set("n", "<M-]>", "<cmd>cnext<CR>")
vim.keymap.set("n", "<M-[>", "<cmd>cprev<CR>")
vim.keymap.set("n", "<M-o>", "<cmd>copen<CR>")
--DIAGNOSTIC
vim.keymap.set(
  "n",
  "<leader>d",
  function() vim.diagnostic.setqflist() end,
  { desc = "Set quickfix list with diagnostics" }
)
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)
--OIL
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
--WINDOWS
vim.keymap.set("n", "<leader>c", "<cmd>q<CR>")
vim.keymap.set("n", "<leader>q", ":qa<CR>", { desc = "Quit all" })
--BUFFERS
vim.keymap.set("n", "<leader>bd", "<cmd>bd<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-[>", ":bprev<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-]>", ":bnext<CR>", { noremap = true, silent = true })
