return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  config = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
    local status_ok, wk = pcall(require, "which-key")
    if not status_ok then
      return
    end

    local setup = {
      icons = {
        breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
        separator = "➜", -- symbol used between a key and it's label
        group = "+", -- symbol prepended to a group
      },
      ignore_missing = true, -- enable this to hide mappings for which you didn't specify a label
    }

    local opts = {
      mode = "n", -- NORMAL mode
      prefix = "<leader>",
      buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
      silent = true, -- use `silent` when creating keymaps
      noremap = true, -- use `noremap` when creating keymaps
      nowait = true, -- use `nowait` when creating keymaps
    }

    local mappings = {
      ["a"] = { "<cmd>Alpha<cr>", "Alpha" },
      --[[ ["e"] = { "<cmd>NvimTreeToggle<cr>", "Explorer" }, ]]
      ["W"] = { "<cmd>w!<CR>", "Save Buffer" },
      ["q"] = { "<cmd>q!<CR>", "Quit Neovim" },
      ["c"] = { "<cmd>Bdelete!<CR>", "Close Buffer" },
      ["h"] = { "<cmd>nohlsearch<CR>", "No Highlight" },
      ["P"] = { "<cmd>Telescope project<CR>", "Projects" },

      f = {
        name = "Telescope",
        b = {
          "<cmd>Telescope buffers<cr>",
          "Buffers",
        },
        f = {
          "<cmd>Telescope find_files<cr>",
          "Find files",
        },
        h = { "<cmd>Telescope help_tags<cr>", "Help"},
        -- d = {'<cmd>lua require("user.telescope").search_dotfiles({ hidden = true })<CR>', "dotfiles"},
        -- D = {'<cmd>lua require("user.telescope").grep_dotfiles({ hidden = true })<CR>', "grep dot"},
        s = {
          "<cmd>Telescope luasnip theme=dropdown layout_config={width=0.8}<cr>",
          "Snippets",
        },
        t = { "<cmd>Telescope live_grep<cr>", "Find Text" },
        p = { "<cmd>Telescope neoclip<cr>", "Clipboard" },
        w = {'<cmd>lua require("plugins.telescope").grep_wiki({ hidden = true })<CR>', "wiki"},
        c = {'<cmd>lua require("user.telescope_extra").grep_buffer({ hidden = true })<CR>', "current buffer"},
      },

      p = {
        name = "Packer",
        c = { "<cmd>PackerCompile<cr>", "Compile" },
        i = { "<cmd>PackerInstall<cr>", "Install" },
        s = { "<cmd>PackerSync<cr>", "Sync" },
        S = { "<cmd>PackerStatus<cr>", "Status" },
        u = { "<cmd>PackerUpdate<cr>", "Update" },
      },

      g = {
        name = "Git",
        g = { "<cmd>lua _LAZYGIT_TOGGLE()<CR>", "Lazygit" },
        n = { "<cmd>Neogit<CR>", "Neogit" },
        j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
        k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
        l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
        p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
        r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
        R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
        s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
        u = {
          "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
          "Undo Stage Hunk",
        },
        o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
        b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
        c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
        d = {
          "<cmd>Gitsigns diffthis HEAD<cr>",
          "Diff",
        },
        D = { "<cmd>DiffviewOpen<cr>", "DiffView" },
      },

      l = {
        name = "LSP",
        a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
        d = {
          "<cmd>Telescope lsp_document_diagnostics<cr>",
          "Document Diagnostics",
        },
        w = {
          "<cmd>Telescope lsp_workspace_diagnostics<cr>",
          "Workspace Diagnostics",
        },
        f = { "<cmd>lua vim.lsp.buf.formatting()<cr>", "Format" },
        i = { "<cmd>LspInfo<cr>", "Info" },
        I = { "<cmd>LspInstallInfo<cr>", "Installer Info" },
        j = {
          "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>",
          "Next Diagnostic",
        },
        k = {
          "<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>",
          "Prev Diagnostic",
        },
        l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
        q = { "<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>", "Quickfix" },
        r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
        s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
        S = {
          "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
          "Workspace Symbols",
        },
      },
      s = {
        name = "Search",
        b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
        c = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
        h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
        M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
        r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
        R = { "<cmd>Telescope registers<cr>", "Registers" },
        k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
        C = { "<cmd>Telescope commands<cr>", "Commands" },
      },

      t = {
        name = "Terminal",
        t = { "<cmd>ToggleTerm<cr>", "ToggleTerm" },
        p = { "<cmd>lua _PYTHON_TOGGLE()<cr>", "Python" },
        w = { "<cmd>lua _TASKW_TOGGLE()<cr>", "TaskWarrior"},
        f = { "<cmd>ToggleTerm direction=float<cr>", "Float" },
        h = { "<cmd>ToggleTerm size=10 direction=horizontal<cr>", "Horizontal" },
        v = { "<cmd>ToggleTerm size=80 direction=vertical<cr>", "Vertical" },
      },
    }

    wk.setup(setup)
    wk.register(mappings, opts)
  end
}
