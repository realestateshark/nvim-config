local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Check packer is installed
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  vim.notify("packer.vim is not installed")
  return
end

-- Packer info as popup window
packer.init {
  display = {
    open_fn = require("packer.util").float
  },
}

-- My plugins to install
return packer.startup(function(use)
  use "wbthomason/packer.nvim" -- Have packer manage itself

  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
