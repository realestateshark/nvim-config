require("plugin.options")
require("plugin.commands")

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
  require("plugin.editor-lsp"),
  require("plugin.editor-cmp"),
  require("plugin.editor-outline"),
  require("plugin.editor-autopairs"),
  require("plugin.debug-dap"),
  require("plugin.editor-jester"),
  require('plugin.editor-formatter'),
  require("plugin.package-manager-mason"),
}

local opts = {}
require("lazy").setup(plugins, opts)
