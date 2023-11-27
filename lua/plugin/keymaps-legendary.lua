return {     
  "mrjones2014/legendary.nvim",
  dependencies = { "stevearc/dressing.nvim" },
  config = function()
    local default_opts = { noremap = true }
    local telescope = require('telescope.builtin')
    local dap = require("dap")

    vim.g.mapleader = " "

    require("legendary").setup {
      keymaps = {
        -- Windows
        { "<C-k>", { n = "<C-w>k" }, description = "Jump to top window", opts = default_opts },
        { "<C-j>", { n = "<C-w>j" }, description = "Jump to bottom window", opts = default_opts },
        { "<C-h>", { n = "<C-w>h" }, description = "Jump to left window", opts = default_opts },
        { "<C-l>", { n = "<C-w>l" }, description = "Jump to right window", opts = default_opts },
        { "<C-Up>", { n = ":resize +10<CR>" }, description = "Increase window height", opts = default_opts },
        { "<C-Down>", { n = ":resize -10<CR>" }, description = "Decrease window height", opts = default_opts },
        { "<C-Right>", { n = ":vertical resize +10<CR>" }, description = "Increase window width", opts = default_opts },
        { "<C-Left>", { n = ":vertical resize -10<CR>" }, description = "Decrease window width", opts = default_opts },
        -- Editor
        { "<A-k>", { x = ":move '<-2<CR>gv-gv" }, description = "Move lines up", opts = default_opts },
        { "<A-j>", { x = ":move '>+1<CR>gv-gv" }, description = "Move lines down", opts = default_opts },
        { "<", { v = "<gv" }, description = "Indent left", opts = default_opts},
        { ">", { v = ">gv" }, description = "Indent right", opts = default_opts},
        { "ei", { n = vim.diagnostic.open_float }, description = "Open diagnostic error popup", opts = default_opts },
        { "el", { n = vim.diagnostic.setloclist }, description = "Open diagnostic error list", opts = default_opts },
        { "ep", { n = vim.diagnostic.goto_prev }, description = "Goto previous diagnostic error", opts = default_opts },
        { "en", { n = vim.diagnostic.goto_next }, description = "Goto next diagnostic error", opts = default_opts },
        { "dn", { n = dap.continue }, description = "Debug start or continue", opts = default_opts },
        { "di", { n = dap.step_into }, description = "Debug step into", opts = default_opts },
        { "dj", { n = dap.step_over }, description = "Debug jump over", opts = default_opts },
        { "do", { n = dap.step_out }, description = "Debug step out", opts = default_opts },
        { "db", { n = dap.toggle_breakpoint }, description = "Debug toggle breakpoint", opts = default_opts },
        { "dt", { n = dap.terminate }, description = "Debug terminate", opts = default_opts },
        -- Files
        { "<Tab>", { n = ":bnext<CR>" }, description = "Next open file", opts = default_opts },
        { "<S-Tab>", { n = ":bprevious<CR>"}, description = "Previous open file", opts = default_opts },
        { "fc", { n = telescope.builtin }, description = "Telescope Commands", opts = default_opts },
        { "ff", { n = telescope.find_files }, description = "Telescope find files", opts = default_opts },
        { "fg", { n = telescope.live_grep }, description = "Telescope find in files", opts = default_opts },
        { "fw", { n = telescope.grep_string }, description = "Telescope find word under cursor in files", opts = default_opts },
        { "fo", { n = telescope.buffers }, description = "Telescope list open files", opts = default_opts },
        { "fs", { n = telescope.git_status }, description = "Telescope list git status", opts = default_opts },
        { "fh", { n = telescope.help_tags }, description = "Telescope help", opts = default_opts },
        -- Explorer
        { "et", { n = ":NvimTreeToggle<CR>"}, description = "Open or close explorer", opts = default_opts },
        { "ec", { n = ":NvimTreeFindFile<CR>"}, description = "Select open File in Explorer", opts = default_opts },
        { "ef", { n = ":NvimTreeFocus<CR>"}, description = "Focus Explorer", opts = default_opts },
        -- Legendary
        { "<C-p>", { n = function() require('legendary').find() end }, description = "Legendary command palette", opts = default_opts },
      }
    }

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
            { "gD", { n = vim.lsp.buf.declaration }, description = "lsp go to declaration", lsp_options },
            { "gd", { n = vim.lsp.buf.definition }, description = "lsp go to definition", lsp_options },
            { "gt", { n = vim.lsp.buf.type_definition }, description = "lsp go to type definition", lsp_options },
            { "gi", { n = vim.lsp.buf.implementation }, description = "lsp go to implementation", lsp_options },
            { "ck", { n = vim.lsp.buf.hover }, description = "lsp code display keyword information", lsp_options },
            { "cs", { n = vim.lsp.buf.signature_help }, description = "lsp code display signature", lsp_options },
            { "ch", { n = vim.lsp.buf.document_highlight }, description = "lsp code highlight word", lsp_options },
            { "cr", { n = vim.lsp.buf.rename }, description = "lsp code rename references", lsp_options },
            { "cf", { n = function() vim.lsp.buf.format { async = true } end, }, description = "lsp code format file", lsp_options },
            { "ca", { n = vim.lsp.buf.code_action }, description = "lsp code action", lsp_options },
            { "cR", { n = vim.lsp.buf.references }, description = "lsp code references list", lsp_options },
          }
        }
      end
    })
  end
}
