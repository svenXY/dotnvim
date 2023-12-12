-- Treesitter
return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = "BufRead",
  dependencies = {
    {"nvim-treesitter/playground",
      cmd = { "TSPlaygroundToggle", "TSHighlightCapturesUnderCursor" },
    },
    "nvim-treesitter/nvim-treesitter-textobjects",
    "nvim-treesitter/nvim-treesitter-refactor",
    "JoosepAlviste/nvim-ts-context-commentstring",
    "windwp/nvim-ts-autotag", -- closing of tags
  },
  config = function()
    -- require("nvim-treesitter.install").compilers = { "gcc-13" }

    local status_ok, configs = pcall(require, "nvim-treesitter.configs")
    if not status_ok then
      return
    end

    configs.setup {
      ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
      sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
      ignore_install = { "php", "phpdoc" }, -- List of parsers to ignore installing
      autopairs = {
        enable = true,
      },
      highlight = {
        enable = true, -- false will disable the whole extension
        disable = { "" }, -- list of language that will be disabled
        additional_vim_regex_highlighting = true,
      },
      indent = { enable = true, disable = { "yaml" } },
      context_commentstring = {
        enable = true,
        enable_autocmd = false,
      },
      playground = {
        enable = true,
        disable = {},
        updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
        persist_queries = false -- Whether the query persists across vim sessions
      },
    }
  end
}

