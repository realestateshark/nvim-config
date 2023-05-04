
local vscode_colors_status_ok, vscode_colors = pcall(require, "vscode.colors")
if not vscode_colors_status_ok then
  vim.notify("vscode.colors is not installed")
  return
end

local vscode_status_ok, vscode = pcall(require, "vscode")
if not vscode_status_ok then
  vim.notify("vscode is not installed")
  return
end

local colors = vscode_colors.get_colors()
vscode.setup({
    -- Alternatively set style in setup
    -- style = 'light'

    -- Enable transparent background
    transparent = true,

    -- Enable italic comment
    italic_comments = true,

    -- Disable nvim-tree background color
    disable_nvimtree_bg = true,

    -- Override colors (see ./lua/vscode/colors.lua)
    color_overrides = {
        vscLineNumber = '#FFFFFF',
    },

    -- Override highlight groups (see ./lua/vscode/theme.lua)
    group_overrides = {
        -- this supports the same val table as vim.api.nvim_set_hl
        -- use colors from this colorscheme by requiring vscode.colors!
        Cursor = { fg=colors.vscDarkBlue, bg=colors.vscLightGreen, bold=true },
    }
})
vscode.load()
