return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = "BufReadPost",
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        "bash",
        "c",
        "html",
        "javascript",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "php",
        "python",
        "query",
        "sql",
        "typescript",
        "vimdoc",
        "vim",
        "yaml"
      },
      highlight = {
        enable = true
      }
    })
  end
}
