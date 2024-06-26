-- Telescope
return {
  "nvim-telescope/telescope.nvim",
  cmd = "Telescope",
  dependencies = {
    "nvim-lua/plenary.nvim",                -- Useful lua functions used ny lots of plugins
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    'nvim-telescope/telescope-file-browser.nvim',
    "benfowler/telescope-luasnip.nvim",
    "cljoly/telescope-repo.nvim",
    "nvim-telescope/telescope-project.nvim",
    --[[ { ]]
    --[[   "nvim-neorg/neorg-telescope", ]]
    --[[   config = function () ]]
    --[[     local neorg_callbacks = require("neorg.callbacks") ]]
    --[[]]
    --[[     neorg_callbacks.on_event("core.keybinds.events.enable_keybinds", function(_, keybinds) ]]
    --[[       -- Map all the below keybinds only when the "norg" mode is active ]]
    --[[       keybinds.map_event_to_mode("norg", { ]]
    --[[         n = { -- Bind keys in normal mode ]]
    --[[           { "<C-s>", "core.integrations.telescope.find_linkable" }, ]]
    --[[           { "<C-S>", "core.integrations.telescope.switch_workspace" }, ]]
    --[[         }, ]]
    --[[]]
    --[[         i = { -- Bind in insert mode ]]
    --[[           { "<C-l>", "core.integrations.telescope.insert_link" }, ]]
    --[[         }, ]]
    --[[       }, { ]]
    --[[           silent = true, ]]
    --[[           noremap = true, ]]
    --[[         }) ]]
    --[[     end) ]]
    --[[   end, ]]
    --[[ }, ]]
      {
        "AckslD/nvim-neoclip.lua",
        config = function()
          require('neoclip').setup()
        end,
      },
    },
    config = function()

      local status_ok, telescope = pcall(require, "telescope")
      if not status_ok then
        return
      end

      local actions = require "telescope.actions"
      local previewers = require('telescope.previewers')

      telescope.setup {
        defaults = {
          file_previewer = previewers.vim_buffer_cat.new,

          prompt_prefix = " ",
          selection_caret = " ",
          path_display = { "smart" },

          mappings = {
            i = {
              ["<C-n>"] = actions.cycle_history_next,
              ["<C-p>"] = actions.cycle_history_prev,

              ["<C-j>"] = actions.move_selection_next,
              ["<C-k>"] = actions.move_selection_previous,

              ["<C-c>"] = actions.close,

              ["<Down>"] = actions.move_selection_next,
              ["<Up>"] = actions.move_selection_previous,

              ["<CR>"] = actions.select_default,
              ["<C-x>"] = actions.select_horizontal,
              ["<C-v>"] = actions.select_vertical,
              ["<C-t>"] = actions.select_tab,

              ["<C-u>"] = actions.preview_scrolling_up,
              ["<C-d>"] = actions.preview_scrolling_down,

              ["<PageUp>"] = actions.results_scrolling_up,
              ["<PageDown>"] = actions.results_scrolling_down,

              ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
              ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
              ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
              ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
              ["<C-l>"] = actions.complete_tag,
              ["<C-_>"] = actions.which_key, -- keys from pressing <C-/> - svh: use c-7
              ["<C-w>"] = actions.which_key, -- keys from pressing <C-/> - svh: use c-7
            },

            n = {
              ["<esc>"] = actions.close,
              ["<CR>"] = actions.select_default,
              ["<C-x>"] = actions.select_horizontal,
              ["<C-v>"] = actions.select_vertical,
              ["<C-t>"] = actions.select_tab,

              ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
              ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
              ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
              ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,

              ["j"] = actions.move_selection_next,
              ["k"] = actions.move_selection_previous,
              ["H"] = actions.move_to_top,
              ["M"] = actions.move_to_middle,
              ["L"] = actions.move_to_bottom,

              ["<Down>"] = actions.move_selection_next,
              ["<Up>"] = actions.move_selection_previous,
              ["gg"] = actions.move_to_top,
              ["G"] = actions.move_to_bottom,

              ["<C-u>"] = actions.preview_scrolling_up,
              ["<C-d>"] = actions.preview_scrolling_down,

              ["<PageUp>"] = actions.results_scrolling_up,
              ["<PageDown>"] = actions.results_scrolling_down,

              ["?"] = actions.which_key,
            },
          },
          vimgrep_arguments = {
            'rg',
            '--color=never',
            '--no-heading',
            '--with-filename',
            '--line-number',
            '--column',
            '--smart-case',
            '--hidden',
            '--follow', -- follow symlinks
            '--iglob',
            '!.git',
            -- '-u', -- grep in hidden files
          },
          file_ignore_patterns = {
            "^node_modules/",
            "^.git/",
          },
        },
        pickers = {
          find_files = {
            -- exclude .git directory, but show hidden files, follow symlinks
            find_command = {
              "fd",
              "--type",
              "f",
              "--strip-cwd-prefix",
              "--hidden",
              "--exclude", ".git",
              "--follow"
            }
          },
          live_grep = {
            mappings = {
                i = { ["<m-f>"] = actions.to_fuzzy_refine },
            },
          },
        },
        extensions = {
          repo = {
            list = {
              fd_opts = {
                "--no-ignore-vcs",
              },
              search_dirs = {
                "~/gitlab-dm/",
                "~/.config/nvim/",
                "~/.dotfiles/",
                "~/dev_other/"
              },
            },
          },
          project = {
            base_dirs = {
              {"~/gitlab-dm/", max_depth = 3},
              {"~/dev_other/", max_depth = 3},
              "~/.config/nvim/",
              "~/.dotfiles/",
            },
            hidden_files = true, -- default: false
            theme = "dropdown",
            order_by = "recent",
            search_by = "title",
          }
        },
      }

      -- To get fzf loaded and working with telescope, you need to call
      -- load_extension, somewhere after setup function:
      require('telescope').load_extension('fzf')
      require("telescope").load_extension "file_browser"
      require'telescope'.load_extension'repo'
      require('telescope').load_extension('luasnip')
      require('telescope').load_extension('neoclip')
      require('telescope').load_extension('project')

    end
  }
