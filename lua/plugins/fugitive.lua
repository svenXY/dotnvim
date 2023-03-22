return {
  "tpope/vim-fugitive",
  config = function()
    vim.g['fugitive_gitlab_domains'] = {'https://gitlab.dm-drogeriemarkt.com'}
    -- :Browse command because netrw is disabled/hijacked
    vim.cmd [[ command! -bar -nargs=1 Browse silent! !open <args> ]]
  end
}
