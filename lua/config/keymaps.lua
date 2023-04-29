-- Default options for normal, visual, select and operator modes
local options = {noremap = true}
local keymap = vim.api.nvim_set_keymap

-- Normal Mode
--- Window
---- Navigation
keymap("n", "<C-h>", "<C-w>h", options);
keymap("n", "<C-j>", "<C-w>j", options);
keymap("n", "<C-k>", "<C-w>k", options);
keymap("n", "<C-l>", "<C-w>l", options);
---- Resize
keymap("n", "<C-Up>", ":resize +10<CR>", options)
keymap("n", "<C-Down>", ":resize -10<CR>", options)
keymap("n", "<C-Left>", ":vertical resize -10<CR>", options)
keymap("n", "<C-Right>", ":vertical resize +10<CR>", options)
--- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", options)
keymap("n", "<S-h>", ":bprevious<CR>", options)
