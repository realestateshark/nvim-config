local M = {}

local keymap = vim.keymap.set
local default_opts = { noremap = true }

function M.setup()
  require("legendary").setup {
    keymaps = {
      { "<A-k>", { x = ":move '<-2<CR>gv-gv" }, description = "Move lines up", opts = default_opts },
      { "<A-j>", { x = ":move '>+1<CR>gv-gv" }, description = "Move lines down", opts = default_opts },
    }
  }
  keymap("n", "<C-p>", "<cmd>lua require('legendary').find()<CR>", default_opts)

end

return M
