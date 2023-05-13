local M = {}

function M.setup()
  local lspconfig = require("lspconfig")
  local cmp_nvim_lsp = require("cmp_nvim_lsp")

  local capabilities = cmp_nvim_lsp.default_capabilities()
  lspconfig.intelephense.setup {
    capabilities = capabilities
  }
  lspconfig.tsserver.setup {
    capabilities = capabilities
  }
end

return M
