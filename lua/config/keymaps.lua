-- Default options for normal, visual, select and operator modes
local options = {noremap = true}
local keymap = vim.api.nvim_set_keymap

-- Normal Mode --
--- Window Navigation
keymap("n", "<C-h>", "<C-w>h", options);
keymap("n", "<C-j>", "<C-w>j", options);
keymap("n", "<C-k>", "<C-w>k", options);
keymap("n", "<C-l>", "<C-w>l", options);
--- Window Resize
keymap("n", "<C-Up>", ":resize +10<CR>", options)
keymap("n", "<C-Down>", ":resize -10<CR>", options)
keymap("n", "<C-Left>", ":vertical resize -10<CR>", options)
keymap("n", "<C-Right>", ":vertical resize +10<CR>", options)
--- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", options)
keymap("n", "<S-h>", ":bprevious<CR>", options)

-- Visual Mode --
--- Stay in indent mode
keymap("v", "<", "<gv", options)
keymap("v", ">", ">gv", options)

-- Visual Block --
--- Move text up and down
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", options)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", options)

-- Terminal Mode --
--- Switch to normal mode
keymap("t", "<Esc>", "<C-\\><C-n>", options)
