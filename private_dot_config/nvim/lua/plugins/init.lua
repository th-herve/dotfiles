return {

  'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically

  'tpope/vim-surround',
  -- 'jiangmiao/auto-pairs',
  -- 'tpope/vim-repeat',
  -- 'mg979/vim-visual-multi',

  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    config = true,
  },

  { 'numToStr/Comment.nvim', opts = {} },

  { 'folke/lazydev.nvim', ft = 'lua' },

  {
    'th-herve/sline-nvim',
    opts = {
      status_line = false,
      contrast = false,
    },
  },
}
