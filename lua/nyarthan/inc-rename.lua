local ok, rename = pcall(require, "inc_rename")
if not ok then
	vim.notify("Error loading module: inc_rename")
	return
end

rename.setup()
