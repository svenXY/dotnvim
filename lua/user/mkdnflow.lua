-- ** DEFAULT SETTINGS; TO USE THESE, PASS NO ARGUMENTS TO THE SETUP FUNCTION **
require('mkdnflow').setup({
    create_dirs = true,
    perspective = {
        priority = 'root',
        fallback = 'current',
        root_tell = 'index.md',
    },
    silent = false,
    links = {
        style = 'markdown',
        name_is_source = false,
        conceal = false,
        context = 0,
        implicit_extension = nil,
        transform_implicit = false,
        transform_explicit = function(text)
            text = text:gsub(" ", "-")
            text = text:lower()
            text = os.date('%Y-%m-%d_')..text
            return(text)
        end
    },
    to_do = {
        symbols = {' ', '.', '✓'},
        update_parents = true,
        not_started = ' ',
        in_progress = '.',
        --[[ complete = '✓' ]]
        complete = '✔︎'
    },
})

-- If you have an init.lua
vim.api.nvim_create_autocmd("FileType", {pattern = "markdown", command = "set awa"})
-- Use the following if your buffer is set to become hidden
vim.api.nvim_create_autocmd("BufLeave", {pattern = "*.md", command = "silent! wall"})
