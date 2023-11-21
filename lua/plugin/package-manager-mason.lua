return {
  "williamboman/mason.nvim",
  build = ":MasonUpdate",
  config = function()
    require("mason").setup()
    require("mason-lspconfig").setup({
      ensure_installed = { "lua_ls", "tsserver" },
    })
  end,    
  dependencies = {
    "williamboman/mason-lspconfig.nvim" -- simple to use language server installer
  }
}
