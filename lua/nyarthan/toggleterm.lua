local toggleterm = require("toggleterm")
local Terminal = require("toggleterm.terminal").Terminal

toggleterm.setup({
	open_mapping = "<leader>tt",
	shell = "fish",
	direction = "float",
	float_opts = {
		border = "curved",
		winblend = 1,
	},
})

local lazygit = Terminal:new({ cmd = "lazygit" })

local function toggleLazygit()
	lazygit:toggle()
end

vim.keymap.set("n", "<leader>tl", toggleLazygit)
