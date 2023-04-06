return {
  --[[ { 'fgheng/winbar.nvim',  ]]
  { 'svenXY/winbar.nvim',
  config = function()
    require('winbar').setup({
      enabled = false,
      right_align = true,

      exclude_filetype = {
        'help',
        'startify',
        'dashboard',
        'packer',
        'NeogitStatus',
        'noice',
        'NvimTree',
        'Trouble',
        'alpha',
        'lir',
        'Outline',
        'spectre_panel',
        'toggleterm',
        'qf',
    }
    })
  end
  }
}
