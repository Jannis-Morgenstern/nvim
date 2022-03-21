local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

-- Leader Space
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
-- normal: n
-- insert: i
-- visual: v
-- visual_block: x
-- term: t
-- command: cq

-- Normal Mode
-- Split navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Tree
keymap("n", "<leader>e", ":NvimTreeToggle<CR>", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)
keymap("n", "<C-w>", ":bdelete<CR>", opts)
-- Insert Mode
keymap("i", "jk", "<ESC>", opts)

-- Visual Mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-1<CR>==", opts)
keymap("v", "p", '"_nP', opts)

-- Visual Blocke Mode
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '>-2<CR>gv-gv", opts)
-- keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", otps)
-- keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Telescope
keymap(
	"n",
	"<leader>f",
	"<cmd> lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false, hidden = true }))<CR>",
	opts
)
keymap("n", "<c-t>", "<cmd> Telescope live_grep<CR>", opts)
