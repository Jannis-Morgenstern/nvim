local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = vim.fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

return packer.startup(function(use)
	-- Package Manager
	use("wbthomason/packer.nvim")

	-- Utils
	use("nvim-lua/popup.nvim")
	use("nvim-lua/plenary.nvim")
	use("famiu/bufdelete.nvim")

	-- Fuzzy Finder
	use("nvim-telescope/telescope.nvim")

	-- Misc
	use("windwp/nvim-autopairs")
	use("kyazdani42/nvim-web-devicons")

	-- File Explorer
	use("kyazdani42/nvim-tree.lua")

	-- Comments
	use("numToStr/Comment.nvim")
	use("JoosepAlviste/nvim-ts-context-commentstring")

	-- Colorschemes
	use("lunarvim/colorschemes")

	-- Completion
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-cmdline")
	use("saadparwaiz1/cmp_luasnip")
	use("hrsh7th/cmp-nvim-lsp")
	use("onsails/lspkind.nvim")
	use("f3fora/cmp-spell")
	use({
		"weilbith/nvim-code-action-menu",
		cmd = "CodeActionMenu",
	})

	-- Snippets
	use("L3MON4D3/LuaSnip")
	use("rafamadriz/friendly-snippets")

	-- LSP
	use("neovim/nvim-lspconfig")
	use("williamboman/nvim-lsp-installer")
	use("jose-elias-alvarez/null-ls.nvim")
	use("folke/lsp-colors.nvim")

	-- Treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})
	use("windwp/nvim-ts-autotag")
	use("p00f/nvim-ts-rainbow")

	-- Git
	use("lewis6991/gitsigns.nvim")

	-- Bufferline
	use("akinsho/bufferline.nvim")

	-- Terminal
	use("akinsho/toggleterm.nvim")

	-- Status Line
	use("nvim-lualine/lualine.nvim")

	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
