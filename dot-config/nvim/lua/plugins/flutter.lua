return {
  'nvim-flutter/flutter-tools.nvim',
  lazy = false,
  dependencies = {
    'nvim-lua/plenary.nvim',
    'stevearc/dressing.nvim', -- optional for vim.ui.select
  },
  config = function()
    require('telescope').load_extension 'flutter'

    key('n', '<leader>ca', vim.lsp.buf.code_action, { desc = '[C]ode [A]ction' }) -- remap because the one set in the lsp is not applied (dk why)
    key('n', '<leader>fl', require('telescope').extensions.flutter.commands, { desc = '[C]ode [A]ction' })
  end,
}
