local toggleterm = require("toggleterm")
local Terminal = require("toggleterm.terminal").Terminal

toggleterm.setup({
	shell = "fish",
	direction = "float",
	on_open = function(term)
		vim.cmd("startinsert!")
		U.make_key({ noremap = true, buffer = term.bufnr, silent = true })("n", "q", U.make_cmd("close"))
	end,
	float_opts = {
		border = "curved",
		winblend = 1,
	},
})

local default = Terminal:new()

local lazygit = Terminal:new({ cmd = "lazygit" })

local function toggleLazygit()
	lazygit:toggle()
end

local function toggleDefault()
	default:toggle()
end

U.key("n", "<leader>tt", toggleDefault)
U.key("n", "<leader>tl", toggleLazygit)
