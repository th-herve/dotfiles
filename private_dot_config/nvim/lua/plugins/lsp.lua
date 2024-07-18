return {

  'neovim/nvim-lspconfig',

  dependencies = {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
  },

  config = function()
    local on_attach = function(_, bufnr)
      local map = function(keys, func, desc)
        if desc then
          desc = 'LSP: ' .. desc
        end
        vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
      end

      -- +-------------------------------+
      -- |           Keybinds            |
      -- +-------------------------------+

      map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
      map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
      map('K', vim.lsp.buf.hover, 'Hover Documentation')
      map('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')
      map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

      vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
        vim.lsp.buf.format()
      end, { desc = 'Format current buffer with LSP' })

      -- telescope lsp keybinds
      local ok, telescope = pcall(require, 'telescope.builtin')
      if ok then
        map('gd', telescope.lsp_definitions, '[G]oto [D]efinition')
        map('gr', telescope.lsp_references, '[G]oto [R]eferences')
        map('gI', telescope.lsp_implementations, '[G]oto [I]mplementation')
        map('<leader>D', telescope.lsp_type_definitions, 'Type [D]efinition')
        map('<leader>ws', telescope.lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
        map('<leader>fh', telescope.help_tags, '[F]ind [H]elp tags')
        map('<leader>ds', function()
          telescope.lsp_document_symbols { symbols = 'function' }
        end, '[D]ocument [S]ymbols')
      end
    end

    -- +-------------------------------+
    -- |       mason and servers       |
    -- +-------------------------------+

    -- mason-lspconfig requires that these setup functions are called in this order
    require('mason').setup()
    require('mason-lspconfig').setup()

    local servers = {
      clangd = {
        format = {
          style = 'llvm',
          indentWidth = 4,
          columnLimit = 100,
        },
      },
      -- gopls = {},
      pyright = {},
      -- rust_analyzer = {},
      tsserver = {},
      html = { filetypes = { 'html', 'twig', 'hbs', 'blade', 'typescript' } },
      cssls = {},
      tailwindcss = { filetypes = { 'html', 'javascript', 'javascriptreact', 'typescriptreact', 'php', 'blade' } },
      emmet_ls = { 'html', 'typescriptreact', 'javascriptreact', 'css', 'sass' },

      lua_ls = {
        Lua = {
          workspace = { checkThirdParty = false },
          telemetry = { enable = false },
        },
      },

      intelephense = { filetypes = { 'php', 'blade' } },
    }

    local ok, cmp = pcall(require, 'cmp_nvim_lsp')
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    if ok then
      capabilities = cmp.default_capabilities(capabilities)
    end

    -- Ensure the servers above are installed
    local mason_lspconfig = require 'mason-lspconfig'

    mason_lspconfig.setup {
      ensure_installed = vim.tbl_keys(servers),
    }

    mason_lspconfig.setup_handlers {
      function(server_name)
        require('lspconfig')[server_name].setup {
          capabilities = capabilities,
          on_attach = on_attach,
          settings = servers[server_name],
          filetypes = (servers[server_name] or {}).filetypes,
        }
      end,
    }

    -- +-------------------------------+
    -- |              ui               |
    -- +-------------------------------+

    vim.diagnostic.config {
      float = { border = 'rounded' },
    }

    require('lspconfig.ui.windows').default_options = {
      border = 'single',
    }

    local signs = { Error = ' ', Warn = ' ', Hint = '󰌵 ', Info = ' ' }
    for type, icon in pairs(signs) do
      local hl = 'DiagnosticSign' .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
    end
  end,
}
