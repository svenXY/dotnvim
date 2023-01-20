require('neorg').setup {
    load = {
        ["core.defaults"] = {},
        --[[ ["core.keybinds"] = {}, ]]
        ["core.norg.concealer"] = {}, -- Allows for use of icons
        ["core.norg.dirman"] = { -- Manage your directories with Neorg
            config = {
                workspaces = {
                    private = "~/neorg/private",
                    wac = "~/neorg/dm/wac",
                },
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
