return {
  --[[ { 'fgheng/winbar.nvim', ]]
  { 'svenXY/winbar.nvim',
  config = function()
    require('winbar').setup({
      enabled = true,
      right_align = true,
    })
  end
  }
}
