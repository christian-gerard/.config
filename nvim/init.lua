vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.g.mapleader = ""

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "http://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    "lazypath",
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
  {
    "scottmckendry/cyberdream.nvim",
    name = "cyberdream",
    lazy = false,
    priority = 1000,
  },
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.5',
    dependencies = { 'nvim-lua/plenary.nvim'}
  },
}

local opts = { 

}

local builtin = require("telescope.builtin")
vim.keymap.set('n','<C-p>', builtin.find_files, {})
require("lazy").setup(plugins, opts)
require("cyberdream").setup()
vim.cmd.colorscheme "cyberdream"
