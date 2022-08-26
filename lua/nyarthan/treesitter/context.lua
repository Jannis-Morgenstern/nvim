local ok, context = pcall(require, "treesitter-context")
if not ok then
	vim.notify("Error loading module: treesitter-context")
	return
end

context.setup({
	enable = true,
})
