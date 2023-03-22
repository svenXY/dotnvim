  -- neorg orgmode stuff
return {
  "nvim-neorg/neorg",
  ft = "norg",
  cmd = { 'Neorg' },
  build = ":Neorg sync-parsers",
  config = function()
    require('neorg').setup {
        load = {
            ["core.defaults"] = {},
            ["core.norg.journal"] = {
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
            ["core.norg.concealer"] = {
              config = {
                icon_preset = "diamond",
              },
            }, -- Allows for use of icons
            ["core.norg.dirman"] = { -- Manage your directories with Neorg
                config = {
                    workspaces = {
                        dm = "~/neorg/dm",
                        svh = "~/neorg/svh",
                        private = "~/neorg/private",
                    },
                    default_workspace = "dm",
                    autodetect = true,
                    autochdir = true,
                }
            },
            ["core.norg.completion"] = {
                config = {
                    engine = "nvim-cmp"
                }
            }
        }
    }

    local autocmd = vim.api.nvim_create_autocmd   -- Create autocommand
    local augroup = vim.api.nvim_create_augroup   -- Create autocommand

    augroup('setNorgAutocmds', { clear = true })
    autocmd('BufEnter', {
      group = 'setNorgAutocmds',
      pattern = 'index.norg',
      command = 'set autochdir',
    })
    autocmd('BufLeave', {
      group = 'setNorgAutocmds',
      pattern = 'index.norg',
      command = 'set noautochdir'
    })
  end
}
