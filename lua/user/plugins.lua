

-- Install your plugins here
return  {
  -- My plugins here
  "nvim-lua/popup.nvim",                  -- An implementation of the Popup API from vim in Neovim
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
  --[[ 'kylechui/nvim-surround', ]]
  { 'echasnovski/mini.surround',
    version = '*',
    keys = function(_, keys)
        -- Populate the keys based on the user's options
        local plugin = require("lazy.core.config").spec.plugins["mini.surround"]
        local opts = require("lazy.core.plugin").values(plugin, "opts", false)
        local mappings = {
          { opts.mappings.add, desc = "Add surrounding", mode = { "n", "v" } },
          { opts.mappings.delete, desc = "Delete surrounding" },
          { opts.mappings.find, desc = "Find right surrounding" },
          { opts.mappings.find_left, desc = "Find left surrounding" },
          { opts.mappings.highlight, desc = "Highlight surrounding" },
          { opts.mappings.replace, desc = "Replace surrounding" },
          { opts.mappings.update_n_lines, desc = "Update `MiniSurround.config.n_lines`" },
        }
        mappings = vim.tbl_filter(function(m)
          return m[1] and #m[1] > 0
        end, mappings)
        return vim.list_extend(mappings, keys)
      end,
    opts = {
      mappings = {
        add = "gza", -- Add surrounding in Normal and Visual modes
        delete = "gzd", -- Delete surrounding
        find = "gzf", -- Find surrounding (to the right)
        find_left = "gzF", -- Find surrounding (to the left)
        highlight = "gzh", -- Highlight surrounding
        replace = "gzr", -- Replace surrounding
        update_n_lines = "gzn", -- Update `n_lines`
      },
    },
    config = function(_, opts)
      -- use gz mappings instead of s to prevent conflict with leap
      require("mini.surround").setup(opts)
    end,
  },
  --[[ "windwp/nvim-autopairs",                -- Autopairs, integrates with both cmp and treesitter ]]
  { 'echasnovski/mini.pairs',
    version = '*',
    event = "VeryLazy",
    config = function(_, opts)
              require("mini.pairs").setup(opts)
            end,},

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
  {"lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
  },
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
