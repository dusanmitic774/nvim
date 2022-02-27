-- noremap means non recursivly
-- silent is to not see output
local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap
--Remap space as leader key
-- keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " " vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",
-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- keymap("n", "<leader>e", ":NvimTreeToggle<cr>", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Split windows
-- keymap("n", "<Leader>v", ":vsplit<CR>", opts)
-- keymap("n", "<Leader>h", ":split<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Move text up and down
-- keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
-- keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)
keymap("n", "<A-j>", ":m .+1<CR>==", opts)
keymap("n", "<A-k>", ":m .-2<CR>==", opts)

-- No highlight
-- keymap("n", "<Leader>h", ":nohlsearch<CR>", opts)

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
-- when we yank something and paste it on top
-- of a word for example, vim automaticaly yanks that word
-- this setting prevents that from happening
keymap("v", "p", '"_dP', opts)

-- Save and Quit
keymap("n", "<C-s>", "<cmd>w!<CR>", opts)
keymap("n", "<C-w>", "<cmd>q!<CR>", opts)

-- Close buffer
-- not an editor command
-- keymap("n", "<Leader>c", "<cmd>BufferClose!<CR>", opts)
-- keymap("n", "<Leader>c", "<cmd>Bdelete!<CR>", opts) --works

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Terminal --
-- Better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- Telescope
-- keymap("n", "<Leader>f", "<cmd>lua require'telescope.builtin'.find_files()<CR>", opts)
-- keymap("n", "<Leader>st", "<cmd>lua require'telescope.builtin'.live_grep()<CR>", opts)
-- keymap("n", "<Leader>ls", "<cmd>lua require'telescope.builtin'.lsp_document_symbols()<CR>", opts)
-- keymap("n", "<Leader>lw", "<cmd>lua require'telescope.builtin'.diagnostics()<CR>", opts)
-- keymap("n", "<Leader>ld", "<cmd>Telescope diagnostics bufnr=0 theme=ivy<CR>", opts)
-- keymap("n", "<Leader>lr", "<cmd>lua require'telescope.builtin'.lsp_references()<CR>", opts)
-- keymap("n", "<Leader>ln", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
-- keymap("n", "<Leader>sb", "<cmd>Telescope buffers<CR>", opts)
-- keymap("n", "<Leader>lf", "<cmd>lua vim.lsp.buf.formatting_sync()<CR>", opts)

-- Git
-- keymap("n", "<Leader>gb", "<cmd>Telescope git_branches<CR>", opts)
-- keymap("n", "<Leader>gc", "<cmd>Telescope git_commits<CR>", opts)
-- keymap("n", "<Leader>gs", "<cmd>Telescope git_status<CR>", opts)
-- keymap("n", "<Leader>gd", "<cmd>Gitsigns diffthis HEAD<CR>", opts)
-- keymap("n", "<Leader>gp", "<cmd>Gitsigns preview_hunk<CR>", opts)

-- Commenting
-- keymap("n", "<Leader>/", "<cmd>lua require('Comment.api').toggle_current_linewise()<CR>", opts)
-- keymap("v", "<Leader>/", "<ESC><CMD>lua require('Comment.api').toggle_linewise_op(vim.fn.visualmode())<CR>", opts)
-- keymap("n", "<C-_>", "<cmd>lua require('Comment.api').toggle_current_linewise()<CR>", opts)
-- keymap("v", "<C-_>", "<ESC><CMD>lua require('Comment.api').toggle_linewise_op(vim.fn.visualmode())<CR>", opts)

-- LSP
-- keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
-- keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
-- keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
-- keymap("n", "gw", "<cmd>lua vim.lsp.buf.document_symbol()<CR>", opts)
-- keymap("n", "gW", "<cmd>lua vim.lsp.buf.workspace_symbol()<CR>", opts)
-- keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
-- keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
-- keymap("n", "<c-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
-- keymap("n", "<leader>n", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
