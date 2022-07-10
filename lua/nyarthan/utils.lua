local U = {}

U.bind = function(fn, args)
	return function()
		return fn(args)
	end
end

U.nv_cmd = vim.api.nvim_command

return U
