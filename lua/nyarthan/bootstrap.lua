local fn = vim.fn
local pack_path = fn.stdpath("data") .. "/site/pack"
local packer_path = pack_path .. "/packer/start/packer.nvim"
local aniseed_path = pack_path .. "/packer/start/aniseed"

if fn.empty(fn.glob(packer_path)) > 0 then
	PACKER_BOOTSTRAP =
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", packer_path })
	fn.system({ "git", "clone", "--depth", "1", "https://github.com/Olical/aniseed", aniseed_path })
	vim.api.nvim_command("packadd packer.nvim")
	vim.api.nvim_command("packadd aniseed")
end

vim.g["aniseed#env"] = {
	module = "fennel.init",
	compile = true,
}
