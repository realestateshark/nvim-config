require("core.options")
require("core.commands")

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
  require("plugin.package-manager-mason"),
  require("plugin.theme-vscode"),
  require("plugin.explorer-nvim-tree"),
  "schillermann/nvim-statusline",
  require("plugin.finder-telescope"),
  require("plugin.keymaps-legendary"),
  require("plugin.syntax-nvim-treesitter"),
  require("plugin.lsp-nvim-lspconfig"),
  require("plugin.lsp-nvim-cmp"),
  require("plugin.lsp-symbols-outline"),
  require("plugin.completion-nvim-autopairs"),
  require('plugin.format-guard'),
  require("plugin.debug-nvim-dap-ui"),
  require("plugin.test-jester"),
  "almo7aya/openingh.nvim",
}

local opts = {}
require("lazy").setup(plugins, opts)
