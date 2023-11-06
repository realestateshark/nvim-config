return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = "BufReadPost",
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        "html",
        "javascript",
        "jsdoc",
        "json",
        "lua",
        "markdown",
        "php",
        "phpdoc",
        "python",
        "regex",
        "sql",
        "typescript",
        "yaml",
      },
      highlight = {
        enable = true
      }
    })
  end
}
