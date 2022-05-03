-- ownstuff.vim
-- Maintainer:   Sven Hergenhahn
-- Version:      0.1

local cmd = vim.cmd  -- to execute Vim commands e.g. cmd('pwd')
-- insert the current date & time
cmd 'iab <expr> dts strftime("%Y-%m-%d %H:%M:%S")'
cmd 'iab <expr> ds strftime("%Y-%m-%d")'

-- close all buffers except the current one
cmd 'command! BufOnly silent! execute "%bd|e#|bd#"'

