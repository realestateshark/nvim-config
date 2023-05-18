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

  vim.keymap.set("n", "<C-p>", "<cmd>lua require('legendary').find()<CR>", default_opts)
  vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", default_opts)

  vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspConfig", {}),
    callback = function(event)
      local bufnr = event.buf
      local lsp_options = { buffer = bufnr }

      -- Enable completion triggered by <c-x><c-o>
      vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

      require("legendary").setup {
        keymaps = {
          { "jd", { n = vim.lsp.buf.declaration }, description = "lsp jump to declaration", lsp_options },
          { "jt", { n = vim.lsp.buf.type_definition }, description = "lsp jump to type definition", lsp_options },
          { "ji", { n = vim.lsp.buf.implementation }, description = "lsp jump to implementation", lsp_options },
          { "dd", { n = vim.lsp.buf.hover }, description = "lsp display definition", lsp_options },
          { "ds", { n = vim.lsp.buf.signature_help }, description = "lsp display signature", lsp_options },
          { "rr", { n = vim.lsp.buf.rename }, description = "lsp rename references", lsp_options },
          { "ff", { n = vim.lsp.buf.format }, description = "lsp format file", lsp_options },
          { "ca", { n = vim.lsp.buf.code_action }, description = "lsp code action", lsp_options },
          { "dl", { n = vim.lsp.codelens.display }, description = "lsp display codelens", lsp_options },
          { "rl", { n = vim.lsp.codelens.run }, description = "lsp run codelens", lsp_options },
        }
      }
    end
  })
end

return M
