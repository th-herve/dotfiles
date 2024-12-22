return {
  'mbbill/undotree',
  key = {
    vim.keymap.set({ 'n', 'o', 'x' }, '<leader>u', '<cmd>UndotreeToggle<CR>'),
  },
  config = function()
    vim.cmd [[ set undodir=~/.undodir_combined ]]
    vim.cmd [[ set undofile ]]
    vim.cmd [[ set undolevels=100000 ]]
    vim.cmd [[ let g:undotree_SetFocusWhenToggle = 1 ]]
  end,
}
