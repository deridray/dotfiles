-- ~/.config/nvim/lua/config/keymaps.lua
local map = vim.keymap.set

-- quick save and exit
map("n", "<leader>w", "<cmd>w<cr>", { desc = "save file" })
map("n", "<leader>q", "<cmd>q<cr>", { desc = "close window" })
map("n", "<leader>wq", "<cmd>wq<cr>", { desc = "save and exit" })
map("n", "<leader>qq", "<cmd>qa<cr>", { desc = "close all nvim" })

-- convenient navigation between splits (ctrl + hjkl)
map("n", "<C-h>", "<C-w>h", { desc = "move left" })
map("n", "<C-j>", "<C-w>j", { desc = "move down" })
map("n", "<C-k>", "<C-w>k", { desc = "move up" })
map("n", "<C-l>", "<C-w>l", { desc = "move right" })

-- move selected lines in visual mode (shift + j / k)
map("v", "J", ":m '>+1<CR>gv=gv", { desc = "move block down" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "move block up" })

-- remove search highlight on esc
map("n", "<Esc>", "<cmd>nohlsearch<cr>")

-- auto-load session if nvim opened in directory without arguments
vim.api.nvim_create_autocmd("VimEnter", {
  group = vim.api.nvim_create_augroup("restore_session", { clear = true }),
  nested = true,
  callback = function()
    if vim.fn.argc() == 0 and not vim.g.started_with_stdin then
      require("persistence").load()
    end
  end,
})