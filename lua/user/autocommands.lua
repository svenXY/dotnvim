vim.cmd [[
  augroup _general_settings
    autocmd!
    autocmd FileType qf,help,lspinfo nnoremap <silent> <buffer> q :close<CR> 
    autocmd FileType man nnoremap <silent> <buffer> q :quit<CR> 
    autocmd TextYankPost * silent!lua require('vim.highlight').on_yank({higroup = 'Visual', timeout = 200}) 
    autocmd BufWinEnter * :set formatoptions-=cro
    autocmd FileType qf set nobuflisted
  augroup end

  augroup _git
    autocmd!
    autocmd FileType gitcommit setlocal wrap
    autocmd FileType gitcommit setlocal spell spelllang=de_de,en
  augroup end

  augroup _markdown
    autocmd!
    autocmd FileType markdown setlocal wrap
    autocmd FileType markdown setlocal spell spelllang=de_de,en
  augroup end

  augroup _auto_resize
    autocmd!
    autocmd VimResized * tabdo wincmd = 
  augroup end

  augroup _pyspark
    autocmd!
    autocmd BufNewFile,BufRead *.pyspark set filetype=python
  augroup end

]]

-- Use internal formatting for bindings like gq. 
 vim.api.nvim_create_autocmd('LspAttach', {
 callback = function(args)
  vim.bo[args.buf].formatexpr = nil
  end
 })
