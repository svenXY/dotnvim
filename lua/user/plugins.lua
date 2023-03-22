

-- Install your plugins here
return  {
  -- My plugins here
  "nvim-lua/popup.nvim",                  -- An implementation of the Popup API from vim in Neovim
  "windwp/nvim-autopairs",                -- Autopairs, integrates with both cmp and treesitter
  "numToStr/Comment.nvim",                -- Easily comment stuff
  {
    "kyazdani42/nvim-tree.lua",
      dependencies = {
        {"kyazdani42/nvim-web-devicons", lazy = true},
      },
  },
  --[[ "akinsho/bufferline.nvim", ]]
  "moll/vim-bbye",
  "nvim-lualine/lualine.nvim",

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- mason stuff
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      -- lsp status updates
      "j-hui/fidget.nvim",
      "onsails/lspkind.nvim",
      "tamago324/nlsp-settings.nvim", -- language server settings defined in json for
      "jose-elias-alvarez/null-ls.nvim", -- for formatters and linters
    },
  },
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
  { "folke/which-key.nvim", lazy = true },
  --[[ 'vimwiki/vimwiki', ]]
  "aserowy/tmux.nvim",                    -- tmux integration
  'kylechui/nvim-surround',

  -- Colorschemes
  --[[ "lunarvim/colorschemes", -- A bunch of colorschemes you can try out ]]
  { "lunarvim/darkplus.nvim", lazy = true, },
  {
  "shaunsingh/nord.nvim",
   lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      -- load the colorscheme here
      vim.cmd([[colorscheme nord]])
    end,
  },

  {
    "hrsh7th/nvim-cmp",
    -- load cmp on InsertEnter
    event = "InsertEnter",
    -- these dependencies will only be loaded when cmp loads
    -- dependencies are always lazy-loaded unless specified otherwise
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path", -- path completions
      "saadparwaiz1/cmp_luasnip", -- snippet completions
    },
  },

  -- snippets
  {
  "L3MON4D3/LuaSnip", --snippet engine
    event = "InsertEnter",
    dependencies = {
      "rafamadriz/friendly-snippets", -- a bunch of snippets to use
      "avneesh0612/react-nextjs-snippets", -- react snippets
    },
  },

  "MunifTanjim/prettier.nvim",
  "windwp/nvim-ts-autotag", -- closing of tags
  "simrat39/rust-tools.nvim",

  -- Telescope
  {
  "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",                -- Useful lua functions used ny lots of plugins
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
      'nvim-telescope/telescope-file-browser.nvim',
      "benfowler/telescope-luasnip.nvim",
      "cljoly/telescope-repo.nvim",
      {
        "AckslD/nvim-neoclip.lua",
        config = function()
          require('neoclip').setup()
        end,
      },
    },
  },

  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    dependencies = {
      "nvim-treesitter/playground",
      "JoosepAlviste/nvim-ts-context-commentstring",
    },
  },

  -- Git
  "lewis6991/gitsigns.nvim",
  {
    "tpope/vim-fugitive",
    dependencies = {
      "shumphrey/fugitive-gitlab.vim",
    },
  },
  'tlvince/vim-auto-commit',
  {
    "TimUntersberger/neogit",
    cmd = 'Neogit',
    dependencies = {
      "sindrets/diffview.nvim",
    },
  },

  -- neorg orgmode stuff
  {
    "nvim-neorg/neorg",
    ft = "norg",
    build = ":Neorg sync-parsers",
  },

  --[[ { ]]
  --[[   'jakewvincent/mkdnflow.nvim', ]]
  --[[   rocks = 'luautf8', -- Ensures optional luautf8 dependency is installed ]]
  --[[ }, ]]
}
