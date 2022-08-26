local ok, lualine = pcall(require, "lualine")
if not ok then
	vim.notify("Error loading module: lualine")
	return
end

local components = {
	progress = function()
		local cur = vim.fn.line(".")
		local total = vim.fn.line("$")
		if cur == 1 then
			return U.left_pad("Top", 3)
		elseif cur == total then
			return U.left_pad("Bot", 3)
		else
			return U.left_pad(math.floor(cur / total * 100) .. "%%", 4)
		end
	end,
}

lualine.setup({
	options = {
		icons_enabled = true,
		theme = "auto",
		section_separators = "",
		component_separators = "|",
		globalstatus = true,
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "branch", "diff", "diagnostics" },
		lualine_c = { "filename" },
		lualine_x = { "encoding", "filetype" },
		lualine_y = { components.progress },
		lualine_z = { "location" },
	},
})
