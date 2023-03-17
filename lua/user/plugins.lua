local fn = vim.fn

vim.g.mapleader = " "  -- Make sure to set `mapleader` before lazy so your mappings are correct

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Install your plugins here
require('lazy').setup({
  -- My plugins here
  "nvim-lua/popup.nvim",                  -- An implementation of the Popup API from vim in Neovim
  "nvim-lua/plenary.nvim",                -- Useful lua functions used ny lots of plugins
  "windwp/nvim-autopairs",                -- Autopairs, integrates with both cmp and treesitter
  "numToStr/Comment.nvim",                -- Easily comment stuff
  "kyazdani42/nvim-web-devicons",
  "kyazdani42/nvim-tree.lua",
  -- "akinsho/bufferline.nvim",
  "moll/vim-bbye",
  "nvim-lualine/lualine.nvim",

  -- mason stuff
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",
  "neovim/nvim-lspconfig",
  {
   "SmiteshP/nvim-navic",
   dependencies = "neovim/nvim-lspconfig",
  },
  "akinsho/toggleterm.nvim",
  "ahmedkhalf/project.nvim",
  "lewis6991/impatient.nvim",
  "lukas-reineke/indent-blankline.nvim",
  "goolord/alpha-nvim",
  "antoinemadec/FixCursorHold.nvim",      -- This is needed to fix lsp doc highlight
  "folke/which-key.nvim",
  --[[ 'vimwiki/vimwiki', ]]
  "aserowy/tmux.nvim",                    -- tmux integration
  -- 'tpope/vim-surround',
  'kylechui/nvim-surround',

  -- Colorschemes
  -- "lunarvim/colorschemes", -- A bunch of colorschemes you can try out
  "lunarvim/darkplus.nvim",
  "shaunsingh/nord.nvim",

  -- cmp plugins
  "hrsh7th/nvim-cmp", -- The completion plugin
  "hrsh7th/cmp-buffer", -- buffer completions
  "hrsh7th/cmp-path", -- path completions
  -- "hrsh7th/cmp-cmdline", -- cmdline completions
  "saadparwaiz1/cmp_luasnip", -- snippet completions
  "hrsh7th/cmp-nvim-lsp",

  -- snippets
  "L3MON4D3/LuaSnip", --snippet engine
  "rafamadriz/friendly-snippets", -- a bunch of snippets to use
  "avneesh0612/react-nextjs-snippets", -- react snippets

  -- clipboard / registers
  {
    "AckslD/nvim-neoclip.lua",
    dependencies = {
      -- you'll need at least one of these
      {'nvim-telescope/telescope.nvim'},
      -- {'ibhagwan/fzf-lua'},
    },
    config = function()
      require('neoclip').setup()
    end,
  },

  -- LSP
  --[[ "neovim/nvim-lspconfig", -- enable LSP ]]
  "onsails/lspkind.nvim",
  --[[ "williamboman/nvim-lsp-installer", -- simple to use language server installer ]]
  "tamago324/nlsp-settings.nvim", -- language server settings defined in json for
  "jose-elias-alvarez/null-ls.nvim", -- for formatters and linters
  "MunifTanjim/prettier.nvim",
  "windwp/nvim-ts-autotag", -- closing of tags

  "simrat39/rust-tools.nvim",

  -- Telescope
  "nvim-telescope/telescope.nvim",
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    build = 'make'
  },
  'nvim-telescope/telescope-file-browser.nvim',
  "benfowler/telescope-luasnip.nvim",
  "cljoly/telescope-repo.nvim",

  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
  },
  "nvim-treesitter/playground",
  "JoosepAlviste/nvim-ts-context-commentstring",

  -- Git
  "lewis6991/gitsigns.nvim",
  'tpope/vim-fugitive',
  "shumphrey/fugitive-gitlab.vim",
  'tlvince/vim-auto-commit',
  "TimUntersberger/neogit",
  "sindrets/diffview.nvim",

  -- neorg orgmode stuff
  {
    "nvim-neorg/neorg",
    --[[ ft = "norg", ]]
    build = ":Neorg sync-parsers",
    dependencies = "nvim-lua/plenary.nvim",
  },

  --[[ { ]]
  --[[   'jakewvincent/mkdnflow.nvim', ]]
  --[[   rocks = 'luautf8', -- Ensures optional luautf8 dependency is installed ]]
  --[[ }, ]]
})
