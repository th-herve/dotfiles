return {
  'stevearc/oil.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  opts = {
    skip_confirm_for_simple_edits = true,
    show_hidden = true,
    keymaps = {
      ['<BS>'] = 'actions.parent',
      ['<leader>b'] = 'actions.close',
    },
  },
  key = {
    key(
      'n',
      '<leader>b',
      ':Oil --float<CR>:set nonumber norelativenumber<CR>:highlight EndOfBuffer guifg=#1D2021<CR>',
      { silent = true, desc = 'Oil' }
    ),
  },
}
