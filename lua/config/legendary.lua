local M = {}
local default_opts = { noremap = true }

function M.setup()
  require("legendary").setup {
    keymaps = {
      -- Window split
      { "<C-k>", { n = "<C-w>k" }, description = "Jump to top window", default_opts }, 
      { "<C-j>", { n = "<C-w>j" }, description = "Jump to bottom window", default_opts }, 
      { "<C-h>", { n = "<C-w>h" }, description = "Jump to left window", default_opts },
      { "<C-l>", { n = "<C-w>l" }, description = "Jump to right window", default_opts },
      -- Window Split Resize
      { "<C-Up>", { n = ":resize +10<CR>" }, description = "Increase window height", default_opts },
      { "<C-Down>", { n = ":resize -10<CR>" }, description = "Decrease window height", default_opts },
      { "<C-Right>", { n = ":vertical resize +10<CR>" }, description = "Increase window width", default_opts },
      { "<C-Left>", { n = ":vertical resize -10<CR>" }, description = "Decrease window width", default_opts },
      -- Move lines
      { "<A-k>", { x = ":move '<-2<CR>gv-gv" }, description = "Move lines up", default_opts },
      { "<A-j>", { x = ":move '>+1<CR>gv-gv" }, description = "Move lines down", default_opts },
      -- Indent lines
      { "<", { v = "<gv" }, description = "Indent left", default_opts},
      { ">", { v = ">gv" }, description = "Indent right", default_opts},
      -- Switch between open files
      { "<S-l>", { n = ":bnext<CR>" }, description = "Next open file", default_opts },
      { "<S-h>", { n = ":bprevious<CR>"}, description = "Previous open file", default_opts },
      -- LSP Errors
      { "ep", { n = vim.diagnostic.open_float }, description = "Open error popup", default_opts },
      { "el", { n = vim.diagnostic.setloclist }, description = "Open error list", default_opts },
      { "ek", { n = vim.diagnostic.goto_prev }, description = "Goto previous error", default_opts },
      { "ej", { n = vim.diagnostic.goto_next }, description = "Goto next error", default_opts },
      -- Explorer
      { "<C-e>", { n = ":NvimTreeToggle<CR>"}, description = "Open or close explorer", default_opts },
    }
  }

  vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspConfig", {}),
    callback = function(event)
      local bufnr = event.buf
      local lsp_options = { buffer = bufnr }

      -- Enable completion triggered by <c-x><c-o>
      vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
      require("legendary").setup {
        keymaps = {
          { "gD", { n = vim.lsp.buf.declaration }, description = "Goto declaration", lsp_options },
          { "gd", { n = vim.lsp.buf.definition }, description = "Goto definition", lsp_options },
          { "K", { n = vim.lsp.buf.hover }, description = "Popup", lsp_options },
          { "gi", { n = vim.lsp.buf.implementation }, description = "Goto implementation", lsp_options },
          { "gK", { n = vim.lsp.buf.signature_help}, description = "Signature", lsp_options },
        }
      }
    end
  })

  vim.keymap.set("n", "<C-p>", "<cmd>lua require('legendary').find()<CR>", default_opts)
end

return M
