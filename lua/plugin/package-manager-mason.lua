return {
  "williamboman/mason.nvim", -- simple to use language server installer
  build = ":MasonUpdate", -- :MasonUpdate updates registry contents
  config = function()
    require("mason").setup()
    require("mason-lspconfig").setup()
  end,    
  dependencies = {
    "williamboman/mason-lspconfig.nvim" -- simple to use language server installer
  }
}
