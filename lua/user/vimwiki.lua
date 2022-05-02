
local g = vim.g
local cmd = vim.cmd

g['vimwiki_global_ext'] = 0
g['vimwiki_ext2syntax'] = {['.md']= 'markdown', ['.markdown']= 'markdown', ['.mdown']= 'markdown'}
g['vimwiki_root'] = '~/vimwiki'
g['vimwiki_listsyms'] = '✗✓'
g['vimwiki_list'] = {
    {path= '~/vimwiki/', syntax= 'markdown', ext= '.md'},
    {path= '~/vimwiki/dm', syntax= 'markdown', ext= '.md'},
    {path= '~/vimwiki/dm/cali', syntax= 'markdown', ext= '.md'},
    {path= '~/vimwiki/dm/cali/refinements', syntax= 'markdown', ext= '.md'},
    {path= '~/vimwiki/dm/TAV', syntax= 'markdown', ext= '.md'},
    {path= '~/vimwiki/tech', syntax= 'markdown', ext= '.md'},
    {path= '~/vimwiki/tech/python', syntax= 'markdown', ext= '.md'}
}

cmd 'au BufWritePost ~/vimwiki/*.md call AutoCommit()'
