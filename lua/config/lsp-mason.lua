local status_ok, mason = pcall(require, "mason")
if not status_ok then
  vim.notify("mason is not installed")
  return
end

mason.setup()

local status_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not status_ok then
  vim.notify("mason-lspconfig is not installed")
  return
end

mason_lspconfig.setup()
