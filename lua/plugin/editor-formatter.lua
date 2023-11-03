return {
  "nvimdev/guard.nvim",
  dependencies = {
      "nvimdev/guard-collection",
  },
  config = function()
    local ft = require('guard.filetype')
    ft('typescript,javascript'):fmt('prettier')

    require('guard').setup({
      fmt_on_save = true
    })
  end
}
