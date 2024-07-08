return {
  'folke/which-key.nvim',
  opts = {
    window = {
      border = 'single',
    },
  },

  config = function()
    require('which-key').register {
      ['<leader>d'] = { name = '[D]ocument', _ = 'which_key_ignore' },
      ['<leader>g'] = { name = '[G]it', _ = 'which_key_ignore' },
      ['<leader>r'] = { name = '[R]ename', _ = 'which_key_ignore' },
      ['<leader>w'] = { name = '[W]iki', _ = 'which_key_ignore' },
      ['<leader>f'] = { name = '[F]uzzy find', _ = 'which_key_ignore' },
      ['<leader>o'] = { name = 'Lang', _ = 'which_key_ignore' },
    }
  end,
}
