return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
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
        "yaml",
      },
      highlight = {
        enable = true
      }
    })
  end
}
