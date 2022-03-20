local status_ok, toggleterm = pcall(require, "toggleterm")
if not status_ok then
	return
end

local Terminal = require("toggleterm.terminal").Terminal

toggleterm.setup({
	size = 20,
	open_mapping = [[<C-\>]],
	hide_numbers = true,
	shade_filetypes = {},
	shade_terminals = true,
	shading_factor = 2,
	start_in_insert = true,
	insert_mappings = true,
	persist_size = true,
	direction = "float",
	close_on_exit = true,
	shell = vim.o.shell,
	float_opts = {
		border = "curved",
		winblend = 15,
		highlights = {
			border = "Normal",
			background = "Normal",
		},
	},
})

local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })

function LazygitToggle()
	lazygit:toggle()
end

vim.api.nvim_set_keymap("n", "<leader>\\", "<cmd>lua LazygitToggle()<CR>", { noremap = true, silent = true })
