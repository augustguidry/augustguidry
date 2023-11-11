-- properties
vim.wo.number = true
vim.wo.cursorline = true
vim.o.cursorcolumn = true

-- use mouse
vim.cmd [[set mouse=a]]

-- enable clipboard use
vim.o.clipboard = "unnamedplus"

-- syntax highlighting
vim.cmd("syntax enable")

-- maintain undo history between sessions
vim.cmd([[set undofile]])

-- remove case sensitive searching but still remain smart
vim.o.ignorecase = true
vim.o.smartcase = true

-- -- -- -- -- 
-- Plugins --
-- -- -- -- --

-- vim lazy loader
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Example using a list of specs with the default options
vim.g.mapleader = " " -- Make sure to set `mapleader` before lazy so your mappings are correct
-- Which-key
require("lazy").setup({
	"folke/which-key.nvim",
	{ "folke/neoconf.nvim", cmd = "Neoconf" },
	"folke/neodev.nvim",

-- Telescope
	{
	'nvim-telescope/telescope.nvim', tag = '0.1.4',
      dependencies = { 'nvim-lua/plenary.nvim' }
    }
})

