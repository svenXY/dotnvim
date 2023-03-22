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
        ["<C-_>"] = actions.which_key, -- keys from pressing <C-/>
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
      -- exclude .git directory, but show hidden files
      find_command = { "fd", "--type", "f", "--strip-cwd-prefix", "--hidden", "--exclude", ".git" }
    },
    -- Default configuration for builtin pickers goes here:
    -- picker_name = {
    --   picker_config_key = value,
    --   ...
    -- }
    -- Now the picker_config_key will be applied every time you call this
    -- builtin picker
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
    -- Your extension configuration goes here:
    -- extension_name = {
    --   extension_config_key = value,
    -- }
    -- please take a look at the readme of the extension you want to configure
  },
}

-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
require('telescope').load_extension('fzf')
require("telescope").load_extension "file_browser"
require'telescope'.load_extension'repo'
require('telescope').load_extension('luasnip')
require('telescope').load_extension('neoclip')


local M = {}
M.grep_man = function()
  require("telescope.builtin").current_buffer_fuzzy_find(
    require('telescope.themes').get_dropdown(
      {
        previewer = false,
        prompt_title = "< GrepMan >",
        layout_config={width=0.8, height=0.8},
      }
    )
  )
end

-- M.find_files = function()
--   require("telescope.builtin").find_files {
--     find_command = { 'rg', '--files', '--iglob', '!.git', '--hidden' },
--     previewer = false
--   }
-- end
--
-- M.search_dotfiles = function()
--     require("telescope.builtin").find_files({
--         prompt_title = "< VimRC >",
--         cwd = '~/.config/nvim',
--         hidden = true,
--     })
-- end
--
-- M.grep_dotfiles = function()
--     require("telescope.builtin").live_grep({
--         prompt_title = "< VimRC >",
--         cwd = '~/.config/nvim',
--         hidden = true,
--     })
-- end
--
 M.grep_wiki = function()
     require("telescope.builtin").live_grep({
         prompt_title = "< VimWiki >",
         cwd = '~/vimwiki',
         hidden = true,
     })
 end
--
-- M.git_branches = function()
--     require("telescope.builtin").git_branches({
--         attach_mappings = function(_, map)
--             map("i", "<c-d>", actions.git_delete_branch)
--             map("n", "<c-d>", actions.git_delete_branch)
--             return true
--         end,
--     })
-- end
--
--
return M
--
