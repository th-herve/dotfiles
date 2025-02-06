return {
  'nvim-flutter/flutter-tools.nvim',
  lazy = false,
  dependencies = {
    'nvim-lua/plenary.nvim',
    'stevearc/dressing.nvim', -- optional for vim.ui.select
  },
  config = function()
    require('telescope').load_extension 'flutter'

    local map = function(keys, func, desc)
      if desc then
        desc = 'LSP: ' .. desc
      end
      vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
    end

    -- +-------------------------------+
    -- |           Keybinds            |
    -- +-------------------------------+

    key('n', '<leader>fl', require('telescope').extensions.flutter.commands, { desc = '[C]ode [A]ction' })

    map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
    map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
    map('K', vim.lsp.buf.hover, 'Hover Documentation')
    map('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')
    map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

    -- telescope lsp keybinds
    local ok, telescope = pcall(require, 'telescope.builtin')
    if ok then
      map('gd', telescope.lsp_definitions, '[G]oto [D]efinition')
      map('gr', telescope.lsp_references, '[G]oto [R]eferences')
      map('gI', telescope.lsp_implementations, '[G]oto [I]mplementation')
      map('<leader>D', telescope.lsp_type_definitions, 'Type [D]efinition')
      map('<leader>ws', telescope.lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
      map('<leader>fs', telescope.lsp_document_symbols, '[F]ind [S]ymbols')
      map('<leader>fh', telescope.help_tags, '[F]ind [H]elp tags')
      map('<leader>ds', function()
        telescope.lsp_document_symbols { symbols = 'function' }
      end, '[D]ocument [S]ymbols')
    end
  end,
}
