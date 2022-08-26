(module fennel.plugins {autoload {nvim aniseed.nvim
                                  a aniseed.core
                                  util config.util
                                  packer packer}})

(fn safe-require-plugin-config [name]
  (let [(ok? val-or-err) (pcall require (.. :config.plugin. name))]
    (when (not ok?)
      (print (.. "config error: " val-or-err)))))

(fn use [...]
  (let [pkgs [...]]
    (packer.startup (fn [use]
                      (for [i 1 (a.count pkgs) 2]
                        (let [name (. pkgs i)
                              opts (. pkgs (+ i 1))]
                          (-?> (. opts :mod) (safe-require-plugin-config))
                          (use (a.assoc opts 1 name)))))))
  nil)

;; fnlfmt: skip
(use
  ; local
  "~/dev/private/nvim-plugins/telescope-code-actions.nvim" {}
  "~/dev/private/nvim-plugins/lsp-notify.nvim" {}

  ; package manager
  :wbthomason/packer.nvim {}
  
  ; fennel integration
  :Olical/aniseed {}

  ; utils
  :nvim-lua/popup.nvim {}
  :nvim-lua/plenary.nvim {}
  :famiu/bufdelete.nvim {}
  
  ; fuzzy finder
  :nvim-telescope/telescope.nvim {}

  ; misc
  :windwp/nvim-autopairs {}
  :stevearc/dressing.nvim {}
  :rcarriga/nvim-notify {}
  :kyazdani42/nvim-web-devicons {}

  ; file explorer
  :kyazdani42/nvim-tree.lua {}

  ; comments
  :numToStr/Comment.nvim {}
  :JoosepAlviste/nvim-ts-context-commentstring {}

  ; colorscheme
  :lunarvim/colorschemes {}

  ; completion
  :hrsh7th/nvim-cmp {}
  :hrsh7th/cmp-buffer {}
  :hrsh7th/cmp-path {}
  :hrsh7th/cmp-cmdline {}
  :saadparwaiz1/cmp_luasnip {}
  :hrsh7th/cmp-nvim-lsp {}
  :onsails/lspkind.nvim {}
  :f3fora/cmp-spell {}
  :folke/trouble.nvim {}

  ; snippets
  :L3MON4D3/LuaSnip {}
  :rafamadriz/friendly-snippets {}

  ; lsp
  :neovim/nvim-lspconfig {}
  :williamboman/nvim-lsp-installer {}
  :jose-elias-alvarez/null-ls.nvim {}
  :folke/lsp-colors.nvim {}
  :j-hui/fidget.nvim {}
  :kosayoda/nvim-lightbulb {}
  :ray-x/lsp_signature.nvim {}
  :smjonas/inc-rename.nvim {}

  ; treesitter
  :nvim-treesitter/nvim-treesitter {"run" ":TSUpdate"}
  :windwp/nvim-ts-autotag {}
  :p00f/nvim-ts-rainbow {}

  ; git
  :lewis6991/gitsigns.nvim {}
  :ThePrimeagen/git-worktree.nvim {}

  ; bufferline
  :akinsho/bufferline.nvim {}

  ; terminal
  :akinsho/toggleterm.nvim {}

  ; statusline
  :nvim-lualine/lualine.nvim {}

  ; performance
  :lewis6991/impatient.nvim {}
  :antoinemadec/FixCursorHold.nvim {})
