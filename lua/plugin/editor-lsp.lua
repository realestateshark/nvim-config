return {
  "neovim/nvim-lspconfig",
  dependencies = { "hrsh7th/cmp-nvim-lsp" },
  config = function()
    vim.diagnostic.config({
      float = {
        border = 'rounded',
      },
    })

    vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
      vim.lsp.handlers.hover,
      {border = 'rounded'}
    )

    vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(
      vim.lsp.handlers.signature_help,
      {border = 'rounded'}
    )

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
}
