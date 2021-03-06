-- following options are the default
-- each of these are documented in `:help nvim-tree.OPTION_NAME`

-- TEMPORARY HACK

vim.cmd "nnoremap <C-n> :NvimTreeToggle<CR>"
vim.cmd "nnoremap <leader>r :NvimTreeRefresh<CR>"
vim.cmd "nnoremap <leader>n :NvimTreeFindFile<CR>"
-- More available functions:
-- NvimTreeOpen
-- NvimTreeClose
-- NvimTreeFocus
-- NvimTreeFindFileToggle
-- NvimTreeResize
-- NvimTreeCollapse
-- NvimTreeCollapseKeepBuffers

vim.cmd [[set termguicolors]] -- this variable must be enabled for colors to be applied properly

-- a list of groups can be found at `:help nvim_tree_highlight`
-- vim.cmd [[highlight NvimTreeFolderIcon guibg=blue]]

-- END TEMPORARY HACK


local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
  return
end

local config_status_ok, nvim_tree_config = pcall(require, "nvim-tree.config")
if not config_status_ok then
  return
end

local tree_cb = nvim_tree_config.nvim_tree_callback

nvim_tree.setup {
  disable_netrw = true,
  hijack_netrw = true,
  open_on_setup = false,
  create_in_closed_folder = true,    --false by default, When creating files, sets the path of a file when cursor is on a closed folder to the parent folder when 0, and inside the folder when 1.
  respect_buf_cwd = true,             --false by default, will change cwd of nvim-tree to that of new buffer's when opening nvim-tree.
  ignore_ft_on_setup = {
    "startify",
    "dashboard",
    "alpha",
  },
  open_on_tab = false,
  hijack_cursor = false,
  update_cwd = true,
  -- update_to_buf_dir = {
  --   enable = true,
  --   auto_open = true,
  -- },
  diagnostics = {
    enable = true,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  },
  update_focused_file = {
    enable = true,
    update_cwd = true,
    ignore_list = {},
  },
  system_open = {
    cmd = nil,
    args = {},
  },
  filters = {
    dotfiles = false,
    custom = {"^\\.git$"},
    exclude = {},
  },
  git = {
    enable = true,
    ignore = true,
    timeout = 500,
  },
  view = {
    width = 30,
    height = 30,
    hide_root_folder = false,
    side = "left",
    -- auto_resize = true,
    mappings = {
      custom_only = false,
      list = {
        { key = { "l", "<CR>", "o" }, cb = tree_cb "edit" },
        { key = "h", cb = tree_cb "close_node" },
        { key = "v", cb = tree_cb "vsplit" },
      },
    },
    number = false,
    relativenumber = false,
  },
  trash = {
    cmd = "trash",
    require_confirm = true,
  },
  renderer = {
    icons = {
      symlink_arrow = ' >> ', -- defaults to ' ➛ '. used as a separator between symlinks' source and target.
      show = {
        git = true,
        folder = true,
        file = true,
        folder_arrow = true,
      },
      padding = ' ',        --one space by default, used for rendering the space between the icon and the filename. Use with caution, it could break rendering if you set an empty string depending on your font.
      glyphs = {
          default = "",
          symlink = "",
          git = {
          unstaged = "✗",
          staged = "✓",
          unmerged = "",
          renamed = "➜",
          untracked = "★",
          deleted = "",
          ignored = "◌"
        },
        folder = {
          arrow_open = "",
          arrow_closed = "",
          default = "",
          open = "",
          empty = "",
          empty_open = "",
          symlink = "",
          symlink_open = "",
        },
      },
    },
    special_files = {
      ["README.md"] = 1, Makefile = 1, MAKEFILE = 1 
    },                               -- List of filenames that gets highlighted with NvimTreeSpecialFile
    add_trailing = true,
    group_empty = true,
    highlight_git = true,            -- false by default, will enable file highlight for git attributes (can be used without the icons).
    highlight_opened_files = "icon", -- 0 by default, will enable folder and file icon highlight for opened files/directories.
    root_folder_modifier = ':~',     -- This is the default. See :help filename-modifiers for more options
  },
--If 0, do not show the icons for one of 'git' 'folder' and 'files'
--1 by default, notice that if 'files' is 1, it will only display
--if nvim-web-devicons is installed and on your runtimepath.
--if folder is 1, you can also tell folder_arrows 1 to show small arrows next to the folder icons.
--but this will not work when you set renderer.indent_markers.enable (because of UI conflict)

-- default will show icon by default if no icon is provided
-- default shows no icon by default
  -- quit_on_open = 0,
  -- git_hl = 1,
  -- disable_window_picker = 0,
  -- root_folder_modifier = ":t",
  -- show_icons = {
  --   git = 1,
  --   folders = 1,
  --   files = 1,
  --   folder_arrows = 1,
  --   tree_width = 30,
  -- },
}
