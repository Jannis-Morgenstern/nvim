local packer = require("packer")

local plugins = {
	-- local
	"~/dev/private/nvim-plugins/telescope-code-actions.nvim",
	"~/dev/private/nvim-plugins/lsp-notify.nvim",

	-- package manager
	"wbthomason/packer.nvim",

	-- utils
	"nvim-lua/popup.nvim",
	"nvim-lua/plenary.nvim",
	"famiu/bufdelete.nvim",

	-- fuzzy finder
	"nvim-telescope/telescope.nvim",

	-- misc
	"windwp/nvim-autopairs",
	"stevearc/dressing.nvim",
	"rcarriga/nvim-notify",
	"kyazdani42/nvim-web-devicons",

	-- file explorer
	"kyazdani42/nvim-tree.lua",

	-- comments
	"numToStr/Comment.nvim",
	"JoosepAlviste/nvim-ts-context-commentstring",

	-- colorscheme
	"tiagovla/tokyodark.nvim",

	-- completion
	"hrsh7th/nvim-cmp",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	"hrsh7th/cmp-cmdline",
	"saadparwaiz1/cmp_luasnip",
	"hrsh7th/cmp-nvim-lsp",
	"onsails/lspkind.nvim",
	"f3fora/cmp-spell",
	"folke/trouble.nvim",

	-- snippets
	"L3MON4D3/LuaSnip",
	"rafamadriz/friendly-snippets",

	-- lsp
	"neovim/nvim-lspconfig",
	"williamboman/nvim-lsp-installer",
	"jose-elias-alvarez/null-ls.nvim",
	"folke/lsp-colors.nvim",
	"j-hui/fidget.nvim",
	"kosayoda/nvim-lightbulb",
	"ray-x/lsp_signature.nvim",
	"smjonas/inc-rename.nvim",
	{ "weilbith/nvim-code-action-menu", { cmd = "CodeActionMen" } },
	"simrat39/rust-tools.nvim",

	-- treesitter
	{ "nvim-treesitter/nvim-treesitter", { run = ":TSUpdat" } },
	"windwp/nvim-ts-autotag",
	"p00f/nvim-ts-rainbow",
	"nvim-treesitter/nvim-treesitter-context",

	-- git
	"lewis6991/gitsigns.nvim",
	"ThePrimeagen/git-worktree.nvim",

	-- bufferline
	"akinsho/bufferline.nvim",

	-- terminal
	"akinsho/toggleterm.nvim",

	-- statusline
	"nvim-lualine/lualine.nvim",

	-- performance
	"lewis6991/impatient.nvim",
	"antoinemadec/FixCursorHold.nvim",
}

packer.startup(function(use)
	for _, value in ipairs(plugins) do
		use(value)
	end
end)
