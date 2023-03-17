
local g = vim.g

local myhome = os.getenv("HOME")
local mywiki = myhome .. '/vimwiki'

g['vimwiki_global_ext'] = 0
g['vimwiki_ext2syntax'] = {['.md']= 'markdown', ['.markdown']= 'markdown', ['.mdown']= 'markdown'}
g['vimwiki_root'] = mywiki
g['vimwiki_listsyms'] = '✗✓'
g['vimwiki_list'] = {
    {path = mywiki, syntax= 'markdown', ext= '.md'},
    {path = mywiki .. '/dm', syntax= 'markdown', ext= '.md'},
    {path = mywiki .. '/dm/cali', syntax= 'markdown', ext= '.md'},
    {path = mywiki .. '/dm/cali/refinements', syntax= 'markdown', ext= '.md'},
    {path = mywiki .. '/dm/TAV', syntax= 'markdown', ext= '.md'},
    {path = mywiki .. '/tech', syntax= 'markdown', ext= '.md'},
    {path = mywiki .. '/tech/python', syntax= 'markdown', ext= '.md'}
}
g['markdown_fenced_languages'] = { 'python', 'sh', 'bash', 'javascript', 'js=javascript', 'json=javascript', 'yaml', 'html' }

-- otherwise it wil steal ctrl-i
vim.api.nvim_set_keymap('n', '<leader>wl', '<Plug>VimwikiNextLink', {})

-- autocommit my wiki edits
-- local cmd = vim.cmd
-- cmd 'au BufWritePost ~/vimwiki/*.md call AutoCommit()'
vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = { mywiki .. "/*.md"},
  callback = "g:AutoCommit"
})
