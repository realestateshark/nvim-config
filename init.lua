--
-- Options
--
vim.opt.clipboard = "unnamedplus"
vim.opt.completeopt = { "menuone", "noselect" }
vim.opt.expandtab = true -- convert tabs to spaces
vim.opt.shiftwidth = 2 -- number of spaces for each indentation
vim.opt.mouse = "" -- mouse is disabled
vim.opt.tabstop = 2 -- number of spaces spaces for a tab
vim.opt.number = true -- turn on line numbering
vim.opt.relativenumber = false -- turn on relative line numbering
vim.opt.signcolumn = "yes" -- avoid shift text
vim.opt.linebreak = true -- wrap without split words
vim.opt.termguicolors = true -- full usage of terminal colors
vim.opt.splitbelow = true

--
-- Commands
--
vim.api.nvim_create_user_command('CloseOtherFiles', function()
  vim.cmd("%bdelete|edit #|normal`")
end,{})
vim.api.nvim_create_user_command('CloseCurrentFile', function()
  vim.cmd("bp|bd#")
end,{})

--
-- Plugins
--
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

local plugins = { 
  require("plugin.theme-vscode"),
  require("plugin.browser-tree"),
  require("plugin.browser-telescope"),
  require("plugin.keymaps-legendary"),
  require("plugin.statusline-hackline"),
  require("plugin.editor-treesitter"),
  require("plugin.editor-snippet"),
  require("plugin.editor-cmp"),
  require("plugin.editor-lsp"),
  require("plugin.editor-outline"),
  require("plugin.editor-autopairs"),
  require("plugin.debug-dap"),
  require("plugin.package-manager-mason"),
}

local opts = {}
require("lazy").setup(plugins, opts)
