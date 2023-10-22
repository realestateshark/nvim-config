return {
  "williamboman/mason.nvim", -- simple to use language server installer
  run = ":MasonUpdate", -- :MasonUpdate updates registry contents
  config = function()
    require("mason").setup()
    require("mason-lspconfig").setup()
  end,    
  requires = {
    "williamboman/mason-lspconfig.nvim" -- simple to use language server installer
  }
}
