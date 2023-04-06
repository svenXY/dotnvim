local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
-- keymap("n", "<C-h>", "<C-w>h", opts)
-- keymap("n", "<C-j>", "<C-w>j", opts)
-- keymap("n", "<C-k>", "<C-w>k", opts)
-- keymap("n", "<C-l>", "<C-w>l", opts)
-- DISABLED as set by tmux.nvim

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Move text up and down
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Terminal --
-- Better terminal navigation
-- keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
-- keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
-- keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
-- keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

keymap('n', '<Leader>gs', '<cmd>Gstatus<CR>', opts)  -- Git status
keymap('n', '<leader>gc',   ':GBranches<CR>', opts)
keymap('n', '<leader>gj', ':diffget //3<CR>', opts)
keymap('n', '<leader>gf', ':diffget //2<CR>', opts)

-- own stuff
keymap('', '<leader>c', '"+y', opts)       -- Copy to clipboard in normal, visual, select and operator modes
keymap('i', '<C-u>', '<C-g>u<C-u>', opts)  -- Make <C-u> undo-friendly
keymap('i', '<C-w>', '<C-g>u<C-w>', opts)  -- Make <C-w> undo-friendly


keymap('n', '<leader>o', 'm`o<Esc>``', opts)  -- Insert a newline in normal mode

-- avoid cursor keys for command history
keymap('c', '<C-p>', '<Up>', opts)
keymap('c', '<C-n>', '<Down>', opts)

-- put active file directory into %%
keymap('c', '%%', "<C-R>=expand('%:h').'/'<cr>", opts)

-- Keep search matches in the middle of the window.
keymap('n', 'n', 'nzzzv', opts)
keymap('n', 'N', 'Nzzzv', opts)

-- telescope
-- keymap('n', '<Leader>ff',  [[<Cmd>lua require('telescope.builtin').find_files()<CR>]], opts)
-- keymap('n', '<Leader>ffg',  [[<Cmd>lua require('telescope.builtin').git_files()<CR>]], opts)
-- keymap('n', '<Leader>fg',  [[<Cmd>lua require('telescope.builtin').live_grep()<CR>]], opts)
-- keymap('n', '<Leader>fb',  [[<Cmd>lua require('telescope.builtin').buffers()<CR>]], opts)
-- keymap('n', '<Leader>fh',  [[<Cmd>lua require('telescope.builtin').help_tags()<CR>]], opts)

-- close buffer
keymap('n', '<Leader><esc>', ':bd<cr>', opts)

-- URL handling
if vim.fn.has("mac") == 1 then
  vim.api.nvim_set_keymap( 'n', 'gx', '<Cmd>call jobstart(["open", expand("<cfile>")], {"detach": v:true})<CR>', {})
elseif vim.fn.has("unix") == 1 then
  vim.api.nvim_set_keymap( 'n', 'gx', '<Cmd>call jobstart(["xdg-open", expand("<cfile>")], {"detach": v:true})<CR>', {} )
else
  vim.api.nvim_set_keymap('n', 'gx', '<Cmd>lua print("Error: gx is not supported on this OS!")<CR>' , {})
end

