-- ~/.config/nvim/lua/config/options.lua
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local opt = vim.opt

opt.number = true          -- line numbers
opt.relativenumber = true  -- relative line numbers
opt.tabstop = 2            -- tab width
opt.shiftwidth = 2
opt.expandtab = true       -- convert tabs to spaces
opt.smartindent = true
opt.wrap = false           -- don't wrap long lines
opt.ignorecase = true      -- case-insensitive search...
opt.smartcase = true       -- ...unless uppercase is entered
opt.termguicolors = true   -- 24-bit color support
opt.signcolumn = "yes"     -- column for git and errors always open
opt.updatetime = 200       -- faster response (for gitsigns/lsp)
opt.clipboard = "unnamedplus" -- shared clipboard with system
vim.opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize", "help", "globals", "skiprtp" }