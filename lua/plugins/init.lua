-- Install your plugins here
return  {
  -- My plugins here
  "nvim-lua/popup.nvim",                  -- An implementation of the Popup API from vim in Neovim
  "numToStr/Comment.nvim",                -- Easily comment stuff
  "moll/vim-bbye",
  "akinsho/toggleterm.nvim",
  "lewis6991/impatient.nvim",
  "lukas-reineke/indent-blankline.nvim",
  "antoinemadec/FixCursorHold.nvim",      -- This is needed to fix lsp doc highlight
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

  "MunifTanjim/prettier.nvim",
  "simrat39/rust-tools.nvim",

  --[[ { ]]
  --[[   'jakewvincent/mkdnflow.nvim', ]]
  --[[   rocks = 'luautf8', -- Ensures optional luautf8 dependency is installed ]]
  --[[ }, ]]
}
