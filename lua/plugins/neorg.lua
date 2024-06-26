-- neorg orgmode stuff
return {
  "nvim-neorg/neorg",
  --[[ "svenXY/neorg", ]]
  ft = "norg",
  version = "v7.0.0",
  cmd = { 'Neorg' },
  dependencies = {
    --[[ { "luarocks.nvim" }, ]]
    { "nvim-lua/plenary.nvim" },
    {"nvim-treesitter/nvim-treesitter"},
    {"nvim-neorg/neorg-telescope"}
  },
  build = ":Neorg sync-parsers",
  config = function()
    require('neorg').setup {
      load = {
        ["core.defaults"] = {},
        ["core.summary"] = {},
        ["core.journal"] = {
          config = {
            toc_format = function(entries)
              local months_text = {
                "January",
                "February",
                "March",
                "April",
                "May",
                "June",
                "July",
                "August",
                "September",
                "October",
                "November",
                "December",
              }
              -- Convert the entries into a certain format to be written
              local output = {}
              local current_year
              local current_month
              for _, entry in ipairs(entries) do
                -- Don't print the year and month if they haven't changed
                if not current_year or current_year < entry[1] then
                  current_year = entry[1]
                  table.insert(output, "* " .. current_year)
                end
                if not current_month or current_month < entry[2] then
                  current_month = entry[2]
                  table.insert(output, "** " .. months_text[current_month])
                end

                -- Prints the file link
                print(vim.inspect(entry))
                table.insert(output, entry[4] .. string.format("[%s]", entry[5]))
              end

              return output
            end,
          },
        },
        --[[ ["core.keybinds"] = {}, ]]
        ["core.concealer"] = {
          config = {
            icon_preset = "diamond",
          },
        }, -- Allows for use of icons
        ["core.dirman"] = { -- Manage your directories with Neorg
          config = {
            workspaces = {
              dm = "~/neorg/dm",
              tech = "~/neorg/tech",
              svh = "~/neorg/svh",
              private = "~/neorg/private",
            },
            default_workspace = "dm",
            autodetect = true,
            autochdir = true,
          }
        },
        ["core.completion"] = {
          config = {
            engine = "nvim-cmp"
          }
        },
        ["core.integrations.telescope"] = {},
        ["core.keybinds"] = {
          config = {
            hook = function(keybinds)
              keybinds.remap_event("norg", "n", "<leader>nf", "core.integrations.telescope.find_linkable" )
              keybinds.remap_event("norg", "n", "<leader>nw", "core.integrations.telescope.switch_workspace")
              keybinds.remap_event("norg", "i", "<C-i>", "core.integrations.telescope.insert_link")
            end,
          },
        },
      },
    }


    local autocmd = vim.api.nvim_create_autocmd   -- Create autocommand
    local augroup = vim.api.nvim_create_augroup   -- Create autocommand

    augroup('setNorgAutocmds', { clear = true })
    autocmd('BufEnter', {
      group = 'setNorgAutocmds',
      pattern = 'index.norg',
      command = 'set autochdir',
    })
    autocmd('BufRead', {
      group = 'setNorgAutocmds',
      pattern = '*.norg',
      command = 'set foldlevelstart=2 conceallevel=1',
    })
    autocmd('BufLeave', {
      group = 'setNorgAutocmds',
      pattern = 'index.norg',
      command = 'set noautochdir'
    })
  end
}
