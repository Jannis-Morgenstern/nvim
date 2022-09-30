local packer = require('packer')

packer.startup(function(use)
  -- local
  use('~/dev/private/nvim-plugins/telescope-code-actions.nvim')
  use('~/dev/private/nvim-plugins/lsp-notify.nvim')

  -- package manager
  use('wbthomason/packer.nvim')

  -- utils
  use('nvim-lua/popup.nvim')
  use('nvim-lua/plenary.nvim')
  use('famiu/bufdelete.nvim')

  -- fuzzy finder
  use('nvim-telescope/telescope.nvim')

  -- misc
  use('windwp/nvim-autopairs')
  use('stevearc/dressing.nvim')
  use('rcarriga/nvim-notify')
  use('kyazdani42/nvim-web-devicons')

  -- file explorer
  use('kyazdani42/nvim-tree.lua')

  -- comments
  use('numToStr/Comment.nvim')
  use('JoosepAlviste/nvim-ts-context-commentstring')

  -- colorscheme
  use('tiagovla/tokyodark.nvim')

  -- completion
  use('hrsh7th/nvim-cmp')
  use('hrsh7th/cmp-buffer')
  use('hrsh7th/cmp-path')
  use('hrsh7th/cmp-cmdline')
  use('saadparwaiz1/cmp_luasnip')
  use('hrsh7th/cmp-nvim-lsp')
  use('onsails/lspkind.nvim')
  use('f3fora/cmp-spell')
  use('folke/trouble.nvim')

  -- snippets
  use('L3MON4D3/LuaSnip')
  use('rafamadriz/friendly-snippets')

  -- lsp
  use('jose-elias-alvarez/null-ls.nvim')
  use('neovim/nvim-lspconfig')
  use('folke/lsp-colors.nvim')
  use('j-hui/fidget.nvim')
  use('kosayoda/nvim-lightbulb')
  use('ray-x/lsp_signature.nvim')
  use('weilbith/nvim-code-action-menu', { cmd = 'CodeActionMen' })
  use('simrat39/rust-tools.nvim')
  use('williamboman/mason.nvim')
  use('williamboman/mason-lspconfig.nvim')
  use('lukas-reineke/lsp-format.nvim')

  -- treesitter
  use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdat' })
  use('windwp/nvim-ts-autotag')
  use('p00f/nvim-ts-rainbow')
  use('nvim-treesitter/nvim-treesitter-context')

  -- git
  use('lewis6991/gitsigns.nvim')
  use('ThePrimeagen/git-worktree.nvim')

  -- bufferline
  use('akinsho/bufferline.nvim')

  -- terminal
  use('akinsho/toggleterm.nvim')

  -- statusline
  use('nvim-lualine/lualine.nvim')

  -- performance
  use('lewis6991/impatient.nvim')
  use('antoinemadec/FixCursorHold.nvim')
end)
