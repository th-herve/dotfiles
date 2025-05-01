return {

  -- Detect tabstop and shiftwidth automatically
  -- 'tpope/vim-sleuth',

  'NMAC427/guess-indent.nvim',
  config = function()
    require('guess-indent').setup {}
  end,
}
