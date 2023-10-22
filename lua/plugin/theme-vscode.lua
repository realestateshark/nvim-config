return {
  "Mofiqul/vscode.nvim",
  config = function()
    local vscode = require("vscode")
    local colors = require("vscode.colors").get_colors()

    vscode.setup({
      -- Alternatively set style in setup
      -- style = 'light'
      transparent = true, -- Enable transparent background
      italic_comments = true, -- Enable italic comment
      disable_nvimtree_bg = true, -- Disable nvim-tree background color
      color_overrides = { -- Override colors (see ./lua/vscode/colors.lua)
        vscLineNumber = '#FFFFFF',
      },
      group_overrides = { -- Override highlight groups (see ./lua/vscode/theme.lua)
        -- this supports the same val table as vim.api.nvim_set_hl
        -- use colors from this colorscheme by requiring vscode.colors!
        Cursor = { fg=colors.vscDarkBlue, bg=colors.vscLightGreen, bold=true },
      }
    })
    vscode.load()
  end
}
