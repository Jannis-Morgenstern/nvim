U = {}

U.bind = function(fn, args)
	return function()
		return fn(args)
	end
end

U.nv_cmd = vim.api.nvim_command

U.key = vim.keymap.set

U.D = function(...)
	local args = { ... }
	print(vim.inspect(unpack(args)))
end

U.make_key = function(opts)
	return function(...)
		local args = { ... }
		table.insert(args, opts)
		U.key(unpack(args))
	end
end

U.make_cmd = function(cmd)
	return U.bind(U.nv_cmd, cmd)
end
